/**
 * @file SafetyMonitor.cpp
 * @brief Implementation of thermal safety protection for ESP32 heating vest
 */

#include "SafetyMonitor.h"

// ═══════════════════════════════════════════════════════════════════════════
// Constructor
// ═══════════════════════════════════════════════════════════════════════════

SafetyMonitor::SafetyMonitor()
    : _currentFault(SafetyFault::NONE)
    , _isSafe(true)
    , _highPowerStartTime(0)
    , _highPowerStartTemp(0.0f)
    , _inHighPowerMode(false)
{
    _tempHistory.reserve(MAX_HISTORY_SIZE);
}

// ═══════════════════════════════════════════════════════════════════════════
// Public Methods
// ═══════════════════════════════════════════════════════════════════════════

void SafetyMonitor::update(float temperature, uint8_t pwmPercent) {
    // Already faulted - require explicit reset
    if (!_isSafe) {
        return;
    }
    
    // Add new sample to history
    _addSample(temperature);
    
    // Prune old samples (keep 5 seconds of history)
    _pruneOldSamples();
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Check 1: Absolute temperature cutoff
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_checkOverTemp(temperature)) {
        _currentFault = SafetyFault::OVER_TEMP;
        _isSafe = false;
        Serial.printf("[SAFETY] FAULT: Over temperature! %.1f°C > %.1f°C\n", 
                      temperature, MAX_TEMP_CUTOFF);
        return;
    }
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Check 2: Sensor disconnection (invalid reading)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_checkSensorDisconnected(temperature)) {
        _currentFault = SafetyFault::SENSOR_DISCONNECTED;
        _isSafe = false;
        Serial.printf("[SAFETY] FAULT: Sensor disconnected! %.1f°C invalid\n", 
                      temperature);
        return;
    }
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Check 3: Rapid temperature change (acceleration protection)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_checkRapidTempChange()) {
        // Fault type determined inside the check
        _isSafe = false;
        return;
    }
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Check 4: Heater fault (no temp rise despite high power)
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (_checkHeaterFault(pwmPercent, temperature)) {
        _currentFault = SafetyFault::HEATER_FAULT;
        _isSafe = false;
        Serial.println("[SAFETY] FAULT: Heater element failure detected!");
        return;
    }
}

bool SafetyMonitor::isSafe() const {
    return _isSafe;
}

SafetyFault SafetyMonitor::getFault() const {
    return _currentFault;
}

const char* SafetyMonitor::getFaultString() const {
    switch (_currentFault) {
        case SafetyFault::NONE:
            return "No fault";
        case SafetyFault::OVER_TEMP:
            return "Over temperature (>55°C)";
        case SafetyFault::SENSOR_DISCONNECTED:
            return "Temperature sensor disconnected";
        case SafetyFault::RAPID_TEMP_DROP:
            return "Rapid temperature drop (sensor detached?)";
        case SafetyFault::THERMAL_RUNAWAY:
            return "Thermal runaway detected";
        case SafetyFault::HEATER_FAULT:
            return "Heater element fault (no temp rise)";
        default:
            return "Unknown fault";
    }
}

void SafetyMonitor::reset() {
    _currentFault = SafetyFault::NONE;
    _isSafe = true;
    _tempHistory.clear();
    _highPowerStartTime = 0;
    _highPowerStartTemp = 0.0f;
    _inHighPowerMode = false;
    Serial.println("[SAFETY] Monitor reset");
}

float SafetyMonitor::getCurrentTemp() const {
    if (_tempHistory.empty()) {
        return NAN;
    }
    return _tempHistory.back().temperature;
}

float SafetyMonitor::getTempFromPast(float secondsAgo) const {
    unsigned long targetTime = millis() - (unsigned long)(secondsAgo * 1000);
    return _getTempAtTime(targetTime);
}

// ═══════════════════════════════════════════════════════════════════════════
// Private Methods
// ═══════════════════════════════════════════════════════════════════════════

void SafetyMonitor::_addSample(float temperature) {
    TempSample sample = {
        .temperature = temperature,
        .timestamp = millis()
    };
    
    // Circular buffer behavior
    if (_tempHistory.size() >= MAX_HISTORY_SIZE) {
        _tempHistory.erase(_tempHistory.begin());
    }
    
    _tempHistory.push_back(sample);
}

void SafetyMonitor::_pruneOldSamples() {
    unsigned long cutoffTime = millis() - HISTORY_DURATION_MS;
    
    // Remove samples older than 5 seconds
    while (!_tempHistory.empty() && _tempHistory.front().timestamp < cutoffTime) {
        _tempHistory.erase(_tempHistory.begin());
    }
}

bool SafetyMonitor::_checkOverTemp(float temperature) {
    return temperature > MAX_TEMP_CUTOFF;
}

bool SafetyMonitor::_checkSensorDisconnected(float temperature) {
    // NaN check
    if (isnan(temperature)) {
        return true;
    }
    
    // Invalid range check
    if (temperature < MIN_TEMP_VALID || temperature > 150.0f) {
        return true;
    }
    
    return false;
}

bool SafetyMonitor::_checkRapidTempChange() {
    // Need at least 2 samples to calculate rate of change
    if (_tempHistory.size() < 2) {
        return false;
    }
    
    unsigned long now = millis();
    unsigned long windowStart = now - DELTA_WINDOW_MS;
    
    // Get temperature from 2 seconds ago
    float tempThen = _getTempAtTime(windowStart);
    if (isnan(tempThen)) {
        return false; // Not enough history yet
    }
    
    float tempNow = _tempHistory.back().temperature;
    float delta = tempNow - tempThen;
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Rapid DROP: Sensor likely detached from skin
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (delta < -MAX_TEMP_DELTA_2S) {
        _currentFault = SafetyFault::RAPID_TEMP_DROP;
        Serial.printf("[SAFETY] FAULT: Rapid temp drop! %.1f°C in 2s\n", delta);
        return true;
    }
    
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    // Rapid RISE: Thermal runaway
    // ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    if (delta > MAX_TEMP_DELTA_2S) {
        _currentFault = SafetyFault::THERMAL_RUNAWAY;
        Serial.printf("[SAFETY] FAULT: Thermal runaway! +%.1f°C in 2s\n", delta);
        return true;
    }
    
    return false;
}

bool SafetyMonitor::_checkHeaterFault(uint8_t pwmPercent, float temperature) {
    unsigned long now = millis();
    
    // Check if we're in high-power mode
    if (pwmPercent >= HIGH_POWER_THRESHOLD) {
        if (!_inHighPowerMode) {
            // Just entered high-power mode - start timer
            _inHighPowerMode = true;
            _highPowerStartTime = now;
            _highPowerStartTemp = temperature;
            Serial.printf("[SAFETY] High power mode started at %.1f°C\n", temperature);
        } else {
            // Already in high-power mode - check duration
            unsigned long elapsed = now - _highPowerStartTime;
            unsigned long timeoutMs = RUNAWAY_TIMEOUT_MINUTES * 60 * 1000;
            
            if (elapsed >= timeoutMs) {
                // 10 minutes elapsed - check if temperature rose
                float tempRise = temperature - _highPowerStartTemp;
                
                if (tempRise < MIN_EXPECTED_TEMP_RISE) {
                    // No significant temperature rise - heater fault!
                    Serial.printf("[SAFETY] Heater fault: Only +%.1f°C after %lu min at >80%% power\n",
                                  tempRise, RUNAWAY_TIMEOUT_MINUTES);
                    return true;
                } else {
                    // Temperature is rising normally, reset timer
                    _highPowerStartTime = now;
                    _highPowerStartTemp = temperature;
                }
            }
        }
    } else {
        // Exited high-power mode
        if (_inHighPowerMode) {
            _inHighPowerMode = false;
            Serial.println("[SAFETY] High power mode ended");
        }
    }
    
    return false;
}

float SafetyMonitor::_getTempAtTime(unsigned long targetTime) const {
    if (_tempHistory.empty()) {
        return NAN;
    }
    
    // If target time is before our oldest sample, use oldest
    if (targetTime <= _tempHistory.front().timestamp) {
        return _tempHistory.front().temperature;
    }
    
    // If target time is after our newest sample, use newest
    if (targetTime >= _tempHistory.back().timestamp) {
        return _tempHistory.back().temperature;
    }
    
    // Linear interpolation between samples
    for (size_t i = 1; i < _tempHistory.size(); i++) {
        if (_tempHistory[i].timestamp >= targetTime) {
            // Interpolate between i-1 and i
            const TempSample& before = _tempHistory[i - 1];
            const TempSample& after = _tempHistory[i];
            
            float ratio = (float)(targetTime - before.timestamp) / 
                          (float)(after.timestamp - before.timestamp);
            
            return before.temperature + ratio * (after.temperature - before.temperature);
        }
    }
    
    return NAN;
}
