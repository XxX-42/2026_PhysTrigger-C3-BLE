/**
 * @file SafetyMonitor.h
 * @brief Thermal safety protection for ESP32 heating vest controller
 * 
 * This class implements multiple safety mechanisms to prevent:
 * - Overheating beyond safe limits
 * - Thermal runaway detection
 * - Sensor fault detection (detachment, malfunction)
 * - Heater element failure
 * 
 * @author PhysTrigger Team
 * @date 2026-01-15
 */

#ifndef SAFETY_MONITOR_H
#define SAFETY_MONITOR_H

#include <Arduino.h>
#include <vector>

// ═══════════════════════════════════════════════════════════════════════════
// Safety Configuration Constants
// ═══════════════════════════════════════════════════════════════════════════

/**
 * @brief Maximum safe temperature (absolute cutoff)
 * @warning Exceeding this temperature will trigger immediate shutdown
 */
constexpr float MAX_TEMP_CUTOFF = 55.0f;

/**
 * @brief Minimum valid temperature reading
 * @note Below this value, sensor is likely disconnected or shorted
 */
constexpr float MIN_TEMP_VALID = -10.0f;

/**
 * @brief Maximum temperature change allowed in 2 seconds
 * @note Exceeding this indicates sensor fault or thermal runaway
 */
constexpr float MAX_TEMP_DELTA_2S = 5.0f;

/**
 * @brief Time window for rate-of-change detection (milliseconds)
 */
constexpr unsigned long DELTA_WINDOW_MS = 2000;

/**
 * @brief History buffer duration (milliseconds)
 */
constexpr unsigned long HISTORY_DURATION_MS = 5000;

/**
 * @brief PWM threshold for "high power" mode (0-100%)
 */
constexpr uint8_t HIGH_POWER_THRESHOLD = 80;

/**
 * @brief Maximum continuous high-power operation without temp rise (minutes)
 */
constexpr unsigned long RUNAWAY_TIMEOUT_MINUTES = 10;

/**
 * @brief Minimum expected temperature rise during high-power mode (°C)
 */
constexpr float MIN_EXPECTED_TEMP_RISE = 2.0f;

// ═══════════════════════════════════════════════════════════════════════════
// Safety State Enum
// ═══════════════════════════════════════════════════════════════════════════

/**
 * @brief Safety fault codes for diagnostic reporting
 */
enum class SafetyFault : uint8_t {
    NONE = 0,                    ///< No fault detected
    OVER_TEMP = 1,               ///< Temperature exceeded MAX_TEMP_CUTOFF
    SENSOR_DISCONNECTED = 2,     ///< Temperature below MIN_TEMP_VALID
    RAPID_TEMP_DROP = 3,         ///< Sensor detachment detected (rapid cooling)
    THERMAL_RUNAWAY = 4,         ///< Rapid uncontrolled heating
    HEATER_FAULT = 5,            ///< No temp rise despite high power
};

// ═══════════════════════════════════════════════════════════════════════════
// Temperature Sample Structure
// ═══════════════════════════════════════════════════════════════════════════

/**
 * @brief Temperature reading with timestamp
 */
struct TempSample {
    float temperature;
    unsigned long timestamp;
};

// ═══════════════════════════════════════════════════════════════════════════
// SafetyMonitor Class
// ═══════════════════════════════════════════════════════════════════════════

/**
 * @brief Thermal safety monitor for heating vest
 * 
 * @code{.cpp}
 * SafetyMonitor safety;
 * 
 * void loop() {
 *     float temp = readTemperature();
 *     uint8_t pwm = getCurrentPwm();
 *     
 *     safety.update(temp, pwm);
 *     
 *     if (!safety.isSafe()) {
 *         disableHeater();
 *         Serial.printf("SAFETY FAULT: %s\n", safety.getFaultString());
 *     }
 * }
 * @endcode
 */
class SafetyMonitor {
public:
    /**
     * @brief Construct a new Safety Monitor
     */
    SafetyMonitor();

    /**
     * @brief Update safety monitor with new readings
     * 
     * @param temperature Current temperature reading (°C)
     * @param pwmPercent Current PWM duty cycle (0-100)
     * 
     * @note Call this every loop iteration (recommended: every 100-500ms)
     */
    void update(float temperature, uint8_t pwmPercent);

    /**
     * @brief Check if system is in safe operating condition
     * 
     * @return true System is safe to continue operation
     * @return false STOP IMMEDIATELY - safety fault detected
     */
    bool isSafe() const;

    /**
     * @brief Get current fault code
     * 
     * @return SafetyFault Current fault, or NONE if safe
     */
    SafetyFault getFault() const;

    /**
     * @brief Get human-readable fault description
     * 
     * @return const char* Fault description string
     */
    const char* getFaultString() const;

    /**
     * @brief Reset safety monitor after fault is cleared
     * 
     * @warning Only call after verifying system is safe!
     */
    void reset();

    /**
     * @brief Get current temperature from history
     * 
     * @return float Latest temperature reading
     */
    float getCurrentTemp() const;

    /**
     * @brief Get temperature from N seconds ago
     * 
     * @param secondsAgo How many seconds in the past
     * @return float Temperature at that time, or NAN if unavailable
     */
    float getTempFromPast(float secondsAgo) const;

private:
    // Current state
    SafetyFault _currentFault;
    bool _isSafe;
    
    // Temperature history buffer (circular buffer)
    std::vector<TempSample> _tempHistory;
    static constexpr size_t MAX_HISTORY_SIZE = 100;
    
    // Runaway detection state
    unsigned long _highPowerStartTime;
    float _highPowerStartTemp;
    bool _inHighPowerMode;
    
    // Private methods
    void _addSample(float temperature);
    void _pruneOldSamples();
    bool _checkOverTemp(float temperature);
    bool _checkSensorDisconnected(float temperature);
    bool _checkRapidTempChange();
    bool _checkHeaterFault(uint8_t pwmPercent, float temperature);
    float _getTempAtTime(unsigned long targetTime) const;
};

#endif // SAFETY_MONITOR_H
