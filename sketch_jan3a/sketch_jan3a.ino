#include <NimBLEDevice.h>
#include <ESP32Servo.h>

Servo myServo;
const int servoPin = 2; // 匹配你之前的物理接线：GPIO 2

class MyCallbacks : public NimBLECharacteristicCallbacks {
    void onWrite(NimBLECharacteristic* pCharacteristic) {
        std::string value = pCharacteristic->getValue();
        if (value.length() > 0) {
            uint8_t cmd = (uint8_t)value[0];
            if (cmd == 0x01) {
                myServo.write(90); // 按钮按下，舵机旋转 90°
                Serial.println(">>> App Pressed: Moving to 90");
            } else if (cmd == 0x00) {
                myServo.write(0);  // 按钮松开，舵机回弹到 0°
                Serial.println(">>> App Released: Resetting to 0");
            }
        }
    }
};

void setup() {
    Serial.begin(115200);
    delay(1000);
    Serial.println(">>> [STEP 1] System Rebooting...");
    
    myServo.attach(servoPin); // 初始化舵机
    myServo.write(0);

    // 初始化蓝牙
    NimBLEDevice::init("PhysTrigger_Device"); // 蓝牙名，Flutter App 会扫描这个名字
    Serial.println(">>> [STEP 3] Attempting BLE Init...");
    
    NimBLEServer* pServer = NimBLEDevice::createServer();
    
    // Use full 128-bit UUID matching Flutter app
    NimBLEService* pService = pServer->createService("4fafc201-1fb5-459e-8fcc-c5c9c331914b");
    NimBLECharacteristic* pChar = pService->createCharacteristic(
        "beb5483e-36e1-4688-b7f5-ea07361b26a8", 
        NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::WRITE_NR
    ); 
    pChar->setCallbacks(new MyCallbacks());
    pService->start();
    
    // --- 关键修复：强制广播身份 ---
    NimBLEAdvertising* pAdvertising = NimBLEDevice::getAdvertising();
    pAdvertising->addServiceUUID("4fafc201-1fb5-459e-8fcc-c5c9c331914b");
    // 强制把名字塞进广播主包
    pAdvertising->setName("PhysTrigger_Device"); 
    pAdvertising->setScanResponse(true); // 开启响应
    pAdvertising->start();
    
    Serial.println(">>> [STEP 5] ALL SYSTEMS GO! Force Advertising Started!");
}

void loop() { delay(10); }