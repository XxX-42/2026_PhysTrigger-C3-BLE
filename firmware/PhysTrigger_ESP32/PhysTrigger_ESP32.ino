/**
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * PhysTrigger ESP32 BLE Reference Firmware
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 * 
 * Purpose: Test/debug firmware for PhysTrigger Flutter BLE app
 * Library: NimBLE-Arduino (lighter & more stable than Bluedroid)
 * 
 * Install NimBLE:
 *   Arduino IDE: Sketch -> Include Library -> Manage Libraries -> "NimBLE-Arduino"
 *   PlatformIO: lib_deps = h2zero/NimBLE-Arduino@^1.4.0
 * 
 * Board Settings (ESP32-C3 example):
 *   - Board: ESP32C3 Dev Module
 *   - USB CDC On Boot: Enabled (for Serial output)
 *   - Flash Mode: QIO
 * 
 * ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 */

#include <NimBLEDevice.h>

// ============================================================================
// BLE Configuration - MUST MATCH Flutter App (byte_utils.dart)
// ============================================================================

// Device name shown in scan results
#define DEVICE_NAME "PhysTrigger_Device"

// Service UUID - Used for scan filtering in Flutter
// Full 128-bit format required by BLE spec
// Short form: FFE0
#define SERVICE_UUID "0000FFE0-0000-1000-8000-00805F9B34FB"

// Characteristic UUID - The data channel for read/write
// Short form: FFE1
#define CHARACTERISTIC_UUID "0000FFE1-0000-1000-8000-00805F9B34FB"

// ============================================================================
// Hardware Configuration
// ============================================================================

// Onboard LED pin (varies by board)
// ESP32 DevKit: GPIO 2
// ESP32-C3: GPIO 8 (some boards), GPIO 2 (others)
// ESP32-S3: GPIO 48 (RGB) or check your board
#define LED_PIN 2

// ============================================================================
// Global Variables
// ============================================================================

NimBLEServer* pServer = nullptr;
NimBLECharacteristic* pCharacteristic = nullptr;
bool deviceConnected = false;
bool oldDeviceConnected = false;

// ============================================================================
// Server Callbacks - Connection Management
// ============================================================================

class ServerCallbacks : public NimBLEServerCallbacks {
  /**
   * Called when a client connects
   */
  void onConnect(NimBLEServer* pServer) override {
    deviceConnected = true;
    
    // Turn ON LED to indicate connection
    digitalWrite(LED_PIN, HIGH);
    
    Serial.println("════════════════════════════════════════");
    Serial.println("✓ Device Connected");
    Serial.println("════════════════════════════════════════");
  }

  /**
   * Called when a client disconnects
   * 
   * CRITICAL: Must restart advertising after disconnect!
   * Otherwise the device becomes invisible to scanners.
   */
  void onDisconnect(NimBLEServer* pServer) override {
    deviceConnected = false;
    
    // Turn OFF LED
    digitalWrite(LED_PIN, LOW);
    
    Serial.println("════════════════════════════════════════");
    Serial.println("✗ Device Disconnected");
    Serial.println("  Restarting advertising...");
    Serial.println("════════════════════════════════════════");
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // IMPORTANT: Restart advertising after disconnect
    // Without this, the device won't appear in scans!
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    NimBLEDevice::startAdvertising();
  }
};

// ============================================================================
// Characteristic Callbacks - Data Reception
// ============================================================================

class CharacteristicCallbacks : public NimBLECharacteristicCallbacks {
  /**
   * Called when the Flutter app writes data to FFE1
   * 
   * Data format from HoldActionButton:
   *   - Press:   [0x01] (or other command codes)
   *   - Release: [0x00] (stop command)
   */
  void onWrite(NimBLECharacteristic* pCharacteristic) override {
    // Get the raw data
    std::string value = pCharacteristic->getValue();
    
    if (value.length() > 0) {
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // Debug: Print received bytes in HEX format
      // This helps verify the Flutter app is sending
      // correct commands matching byte_utils.dart
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      Serial.print("Received: ");
      for (size_t i = 0; i < value.length(); i++) {
        uint8_t byte = (uint8_t)value[i];
        
        // Print in "0x01" format
        Serial.print("0x");
        if (byte < 0x10) Serial.print("0"); // Leading zero for single digits
        Serial.print(byte, HEX);
        
        if (i < value.length() - 1) Serial.print(" ");
      }
      Serial.println();
      
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      // Command Logic - Match BleCommands in byte_utils.dart
      // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      uint8_t command = (uint8_t)value[0];
      
      switch (command) {
        case 0x00:
          Serial.println("  → ACTION: RELEASE (Stop)");
          // Add your motor/actuator stop logic here
          break;
          
        case 0x01:
          Serial.println("  → ACTION: PRESS (Forward)");
          // Add your motor forward logic here
          break;
          
        case 0x02:
          Serial.println("  → ACTION: PRESS (Backward)");
          // Add your motor backward logic here
          break;
          
        case 0x03:
          Serial.println("  → ACTION: PRESS (Left)");
          // Add your motor left logic here
          break;
          
        case 0x04:
          Serial.println("  → ACTION: PRESS (Right)");
          // Add your motor right logic here
          break;
          
        default:
          Serial.print("  → ACTION: UNKNOWN (");
          Serial.print(command);
          Serial.println(")");
          break;
      }
    }
  }
};

// ============================================================================
// Setup - Initialize BLE Server
// ============================================================================

void setup() {
  // Initialize Serial for debugging
  Serial.begin(115200);
  delay(1000); // Wait for serial monitor
  
  Serial.println();
  Serial.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  Serial.println("  PhysTrigger BLE Reference Firmware");
  Serial.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  Serial.print("  Device Name: ");
  Serial.println(DEVICE_NAME);
  Serial.print("  Service:     ");
  Serial.println(SERVICE_UUID);
  Serial.print("  Characteristic: ");
  Serial.println(CHARACTERISTIC_UUID);
  Serial.println("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
  
  // Initialize LED
  pinMode(LED_PIN, OUTPUT);
  digitalWrite(LED_PIN, LOW);
  
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Initialize NimBLE
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  NimBLEDevice::init(DEVICE_NAME);
  
  // Optional: Set transmit power for better range
  // NimBLEDevice::setPower(ESP_PWR_LVL_P9); // Max power
  
  // Create BLE Server
  pServer = NimBLEDevice::createServer();
  pServer->setCallbacks(new ServerCallbacks());
  
  // Create Service with UUID matching Flutter app
  NimBLEService* pService = pServer->createService(SERVICE_UUID);
  
  // Create Characteristic with required properties:
  // - WRITE: Standard write with response (reliable)
  // - WRITE_NR (No Response): Fast write without confirmation
  // - NOTIFY: Server can push data to client
  pCharacteristic = pService->createCharacteristic(
    CHARACTERISTIC_UUID,
    NIMBLE_PROPERTY::WRITE |
    NIMBLE_PROPERTY::WRITE_NR |
    NIMBLE_PROPERTY::NOTIFY |
    NIMBLE_PROPERTY::READ
  );
  
  // Set callbacks for write events
  pCharacteristic->setCallbacks(new CharacteristicCallbacks());
  
  // Start the service
  pService->start();
  
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  // Start Advertising
  // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  NimBLEAdvertising* pAdvertising = NimBLEDevice::getAdvertising();
  
  // Add service UUID to advertisement so Flutter can filter by it
  pAdvertising->addServiceUUID(pService->getUUID());
  
  // Enable scan response for device name
  pAdvertising->setScanResponse(true);
  
  // Start advertising
  pAdvertising->start();
  
  Serial.println();
  Serial.println("✓ BLE Server started. Waiting for connections...");
  Serial.println();
}

// ============================================================================
// Main Loop
// ============================================================================

void loop() {
  // Handle connection state changes
  if (!deviceConnected && oldDeviceConnected) {
    // Just disconnected - give stack time to reset
    delay(500);
    oldDeviceConnected = deviceConnected;
  }
  
  if (deviceConnected && !oldDeviceConnected) {
    // Just connected
    oldDeviceConnected = deviceConnected;
  }
  
  // Optional: Blink LED slowly when waiting for connection
  if (!deviceConnected) {
    static unsigned long lastBlink = 0;
    if (millis() - lastBlink > 1000) {
      digitalWrite(LED_PIN, !digitalRead(LED_PIN));
      lastBlink = millis();
    }
  }
  
  delay(10); // Small delay to prevent watchdog issues
}

// ============================================================================
// TROUBLESHOOTING GUIDE
// ============================================================================
/*

┌─────────────────────────────────────────────────────────────────────────────┐
│ PlatformException(connect, status: 133) - Most Common Android BLE Error    │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ Error 133 (GATT_ERROR) is a generic "something went wrong" error.          │
│ Common causes and solutions:                                                │
│                                                                             │
│ 1. DEVICE BONDING ISSUE                                                     │
│    • Go to Android Settings → Bluetooth → Paired Devices                    │
│    • Remove/Forget the ESP32 device                                         │
│    • Restart Bluetooth on phone                                             │
│    • Try connecting again                                                   │
│                                                                             │
│ 2. ESP32 NOT ADVERTISING                                                    │
│    • After disconnect, advertising must be restarted                        │
│    • This firmware handles it in onDisconnect()                             │
│    • If still an issue, power cycle the ESP32                               │
│                                                                             │
│ 3. TOO MANY CACHED CONNECTIONS                                              │
│    • Android caches BLE connections                                         │
│    • Clear Bluetooth cache:                                                 │
│      Settings → Apps → Bluetooth → Storage → Clear Cache                    │
│                                                                             │
│ 4. GATT SERVER BUSY                                                         │
│    • Add delay between rapid connect/disconnect cycles                      │
│    • Wait 500ms-1s before retrying connection                               │
│                                                                             │
│ 5. DISTANCE/SIGNAL ISSUE                                                    │
│    • Move phone closer to ESP32                                             │
│    • Increase TX power: NimBLEDevice::setPower(ESP_PWR_LVL_P9)              │
│                                                                             │
│ 6. FLUTTER APP DEBUG                                                        │
│    • Check Flutter console for detailed error messages                      │
│    • Verify UUIDs match exactly (case-insensitive)                          │
│    • Ensure characteristics are discovered before write                     │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────────┐
│ How to Modify UUIDs for Different Hardware                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│ To match a different BLE peripheral:                                        │
│                                                                             │
│ 1. Use a BLE scanner app (LightBlue, nRF Connect) to find the device        │
│                                                                             │
│ 2. Note down the Service UUID and Characteristic UUID                       │
│                                                                             │
│ 3. Update these files:                                                      │
│    • ESP32: Change SERVICE_UUID and CHARACTERISTIC_UUID above               │
│    • Flutter: Update BleUuids in lib/core/utils/byte_utils.dart             │
│                                                                             │
│ Common BLE Module UUIDs:                                                    │
│    HM-10:   FFE0 / FFE1 (default)                                           │
│    HC-08:   FFE0 / FFE1                                                     │
│    JDY-08:  FFE0 / FFE1                                                     │
│    Custom:  Use UUID generator (uuidgenerator.net)                          │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘

*/
