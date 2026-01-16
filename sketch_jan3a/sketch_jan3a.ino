#include <BLEDevice.h>
#include <BLEServer.h>
#include <BLEUtils.h>

// ------------------------------------------------
// 1. 硬件引脚定义
// ------------------------------------------------
#define PIN_MOS    4    // MOS 管信号线
#define PIN_LED    8    // 板载指示灯

// PWM 设置 (适配 ESP32 v3.0+)
const int PWM_FREQ = 5000;
const int PWM_RES  = 8;

// ------------------------------------------------
// 2. 全局状态变量
// ------------------------------------------------
int target_pwm = 0;   // 目标 (0-255)
int current_pwm = 0;  // 当前 (0-255)
bool is_heating = false;

// UUID 保持与你 Flutter App / 之前验证的框架一致
#define SERVICE_UUID        "4fafc201-1fb5-459e-8fcc-c5c9c331914b"
#define CHAR_UUID           "beb5483e-36e1-4688-b7f5-ea07361b26a8"

// ------------------------------------------------
// 3. 蓝牙回调逻辑
// ------------------------------------------------
class MyCallbacks: public BLECharacteristicCallbacks {
    void onWrite(BLECharacteristic *pCharacteristic) {
        // 原生库返回 String
        String value = pCharacteristic->getValue();
        
        if (value.length() > 0) {
            uint8_t cmd = (uint8_t)value[0];
            
            // 限制 0-100%
            if (cmd > 100) cmd = 100;
            
            // 计算目标 PWM
            target_pwm = map(cmd, 0, 100, 0, 255);
            is_heating = (cmd > 0);

            // 实时打印监控
            Serial.println("\n-----------------------------");
            Serial.printf(">>> 指令收到: %d%%\n", cmd);
            Serial.printf(">>> 目标 PWM 设定为: %d\n", target_pwm);
            Serial.println("-----------------------------");
        }
    }
};

class MyServerCallbacks: public BLEServerCallbacks {
    void onConnect(BLEServer* pServer) {
        Serial.println("\n[!] 蓝牙已连接");
    }
    void onDisconnect(BLEServer* pServer) {
        Serial.println("\n[!] 蓝牙已断开，重新启动广播...");
        // 必须重启广播，否则断开后搜不到
        BLEDevice::startAdvertising();
    }
};

// ------------------------------------------------
// 4. 初始化
// ------------------------------------------------
void setup() {
    Serial.begin(115200);
    delay(3000); // 给串口启动时间

    Serial.println("\n=== 发热背心系统：正式版启动 (V1.1) ===");

    pinMode(PIN_LED, OUTPUT);
    digitalWrite(PIN_LED, HIGH); // 初始灭

    // 初始化 PWM
    if (!ledcAttach(PIN_MOS, PWM_FREQ, PWM_RES)) {
        Serial.println("PWM 初始化失败！");
    }
    ledcWrite(PIN_MOS, 0);

    // 蓝牙配置
    BLEDevice::init("PhysTrigger_Vest"); 
    
    // --- 修正点在这里：使用 BLEDevice 创建服务器 ---
    BLEServer *pServer = BLEDevice::createServer();
    pServer->setCallbacks(new MyServerCallbacks());

    BLEService *pService = pServer->createService(SERVICE_UUID);
    BLECharacteristic *pChar = pService->createCharacteristic(
                                    CHAR_UUID,
                                    BLECharacteristic::PROPERTY_WRITE |
                                    BLECharacteristic::PROPERTY_WRITE_NR
                                );

    pChar->setCallbacks(new MyCallbacks());
    pService->start();

    // 广播配置
    BLEAdvertising *pAdvertising = BLEDevice::getAdvertising();
    pAdvertising->addServiceUUID(SERVICE_UUID);
    pAdvertising->setScanResponse(true);
    BLEDevice::startAdvertising();

    Serial.println(">>> 系统就绪，等待 App 指令...");
}

// ------------------------------------------------
// 5. 核心循环：软启动逻辑 (防崩溃)
// ------------------------------------------------
void loop() {
    // 软启动/平滑过渡
    if (current_pwm < target_pwm) {
        current_pwm++;
        ledcWrite(PIN_MOS, current_pwm);
        delay(10); 
    } 
    else if (current_pwm > target_pwm) {
        current_pwm--;
        ledcWrite(PIN_MOS, current_pwm);
        delay(10);
    }
    
    // 指示灯逻辑：加热时灯亮
    if (is_heating) {
        digitalWrite(PIN_LED, LOW); 
    } else {
        digitalWrite(PIN_LED, HIGH);
    }

    delay(1);
}