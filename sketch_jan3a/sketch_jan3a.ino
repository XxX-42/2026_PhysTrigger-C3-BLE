#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>
#include <BLE2902.h>
#include <Wire.h>
#include <Adafruit_MLX90614.h>

// ------------------------------------------------
// 1. 硬件引脚定义
// ------------------------------------------------
#define PIN_MOS    4    // MOS 管信号线
#define PIN_LED    8    // 板载指示灯
#define PIN_SDA    5    // I2C SDA
#define PIN_SCL    6    // I2C SCL

const int PWM_FREQ = 5000;
const int PWM_RES  = 8;

// ------------------------------------------------
// 2. 全局状态变量
// ------------------------------------------------
int target_pwm = 0;
int current_pwm = 0;
bool is_heating = false;

Adafruit_MLX90614 mlx = Adafruit_MLX90614(); 
unsigned long last_temp_time = 0;

// 蓝牙 UUID
#define SERVICE_UUID        "4fafc201-1fb5-459e-8fcc-c5c9c331914b"
#define CHAR_UUID_CTRL      "beb5483e-36e1-4688-b7f5-ea07361b26a8"
#define CHAR_UUID_TEMP      "beb5483e-36e1-4688-b7f5-ea07361b26a9"

BLECharacteristic *pTempChar = NULL; 

// ------------------------------------------------
// 3. 辅助函数：生成运行时间戳 [H:M:S]
// ------------------------------------------------
String getTimestamp() {
    unsigned long totalSeconds = millis() / 1000;
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = (totalSeconds / 3600);

    char buf[20];
    snprintf(buf, sizeof(buf), "[%02d:%02d:%02d]", hours, minutes, seconds);
    return String(buf);
}

// ------------------------------------------------
// 4. 蓝牙回调
// ------------------------------------------------
class MyCallbacks: public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pCharacteristic) {
        String value = pCharacteristic->getValue();
        if (value.length() > 0) {
            uint8_t cmd = (uint8_t)value[0];
            if (cmd > 100) cmd = 100;
            target_pwm = map(cmd, 0, 100, 0, 255);
            is_heating = (cmd > 0);
        }
    }
};

class MyServerCallbacks: public BLEServerCallbacks {
    // 兼容性修正：使用标准的单参数 onConnect
    void onConnect(BLEServer* pServer) {
        // 由于无法直接从单参数获取 MAC，我们通过全局 Device 状态打印连接事件
        Serial.print(getTimestamp());
        Serial.println(" [BLE] 设备已连接 | 系统正在握手...");
    }

    void onDisconnect(BLEServer* pServer) {
        Serial.println(getTimestamp() + " [!!!] 蓝牙断开 - 触发安全熔断");
        
        // 立即物理停机
        target_pwm = 0;
        current_pwm = 0;
        is_heating = false;
        ledcWrite(PIN_MOS, 0);
        digitalWrite(PIN_LED, HIGH);
        
        // 重启广播
        BLEDevice::startAdvertising();
    }
};

// ------------------------------------------------
// 5. 初始化
// ------------------------------------------------
void setup() {
    Serial.begin(115200);
    delay(2000);

    Serial.println("\n" + getTimestamp() + " === 系统正式版 V3.0 (高兼容) 启动 ===");

    pinMode(PIN_LED, OUTPUT);
    digitalWrite(PIN_LED, HIGH);
    
    // 初始化 PWM 控制
    ledcAttach(PIN_MOS, PWM_FREQ, PWM_RES);
    ledcWrite(PIN_MOS, 0);

    // 初始化 I2C 温度传感器
    Wire.begin(PIN_SDA, PIN_SCL);
    if (!mlx.begin()) {
        Serial.println(getTimestamp() + " ❌ MLX90614 初始化失败，请检查接线");
    }

    // 初始化蓝牙设备
    BLEDevice::init("PhysTrigger_Vest"); 
    BLEServer *pServer = BLEDevice::createServer();
    pServer->setCallbacks(new MyServerCallbacks());

    // 创建服务
    BLEService *pService = pServer->createService(SERVICE_UUID);
    
    // 特征值 1: 控制 (Write)
    BLECharacteristic *pCtrlChar = pService->createCharacteristic(
                                    CHAR_UUID_CTRL,
                                    BLECharacteristic::PROPERTY_WRITE |
                                    BLECharacteristic::PROPERTY_WRITE_NR
                                );
    pCtrlChar->setCallbacks(new MyCallbacks());

    // 特征值 2: 温度 (Read/Notify)
    pTempChar = pService->createCharacteristic(
                                    CHAR_UUID_TEMP,
                                    BLECharacteristic::PROPERTY_READ | 
                                    BLECharacteristic::PROPERTY_NOTIFY
                                );
    // 增加描述符以支持 Notify
    pTempChar->addDescriptor(new BLE2902());

    pService->start();

    // 广播配置
    BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
    pAdvertising->addServiceUUID(SERVICE_UUID);
    pAdvertising->setScanResponse(true);
    pAdvertising->start();
    
    Serial.println(getTimestamp() + " >>> 准备就绪，当前电压稳定。");
}

// ------------------------------------------------
// 6. 主循环
// ------------------------------------------------
void loop() {
    // A. 加热软启动逻辑：防止电流浪涌导致重启
    if (current_pwm < target_pwm) {
        current_pwm++;
        ledcWrite(PIN_MOS, current_pwm);
        delay(10); 
    } else if (current_pwm > target_pwm) {
        current_pwm--;
        ledcWrite(PIN_MOS, current_pwm);
        delay(10);
    }
    
    // LED 状态与加热同步：低电平点亮指示灯
    digitalWrite(PIN_LED, is_heating ? LOW : HIGH);

    // B. 定时温度监测与时间戳输出 (每 1000ms)
    if (millis() - last_temp_time > 1000) {
        last_temp_time = millis();
        
        float objTemp = mlx.readObjectTempC();
        if (objTemp > -100 && objTemp < 200) {
            // 串口输出格式：[HH:MM:SS] [🌡️ 温度监测] 目标温度: XX.XX C
            Serial.print(getTimestamp()); 
            Serial.printf(" [🌡️ 温度监测] 目标温度: %.2f C\n", objTemp);
            
            // 蓝牙 Notify 推送数据到 App
            String tempStr = String(objTemp, 2); 
            if (pTempChar != NULL) {
                pTempChar->setValue(tempStr.c_str());
                pTempChar->notify();
            }
        }
    }
    
    delay(5);
}