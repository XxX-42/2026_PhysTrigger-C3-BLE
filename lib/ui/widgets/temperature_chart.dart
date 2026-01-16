/// Temperature Chart Widget
/// 
/// Displays real-time temperature data from PhysTrigger Vest
library;

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TemperatureChart extends StatelessWidget {
  final List<double> temperatureData;
  final double currentTemperature;

  const TemperatureChart({
    super.key,
    required this.temperatureData,
    required this.currentTemperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF30363D),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Temperature Display
          Row(
            children: [
              const Icon(
                Icons.thermostat,
                color: Color(0xFFF0883E),
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                '${currentTemperature.toStringAsFixed(1)}°C',
                style: const TextStyle(
                  color: Color(0xFFF0883E),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '实时温度',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Line Chart
          Expanded(
            child: temperatureData.isEmpty
                ? Center(
                    child: Text(
                      '等待温度数据...',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 14,
                      ),
                    ),
                  )
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 5,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: const Color(0xFF30363D),
                            strokeWidth: 1,
                          );
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: const TextStyle(
                                  color: Color(0xFF8B949E),
                                  fontSize: 10,
                                ),
                              );
                            },
                            reservedSize: 30,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 29,
                      minY: _calculateMinY(),
                      maxY: _calculateMaxY(),
                      lineBarsData: [
                        LineChartBarData(
                          spots: _buildSpots(),
                          isCurved: true,
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFF0883E),
                              Color(0xFFDA3633),
                            ],
                          ),
                          barWidth: 3,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFFF0883E).withOpacity(0.3),
                                const Color(0xFFDA3633).withOpacity(0.1),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  List<FlSpot> _buildSpots() {
    return List.generate(
      temperatureData.length,
      (index) => FlSpot(index.toDouble(), temperatureData[index]),
    );
  }

  double _calculateMinY() {
    if (temperatureData.isEmpty) return 0;
    final min = temperatureData.reduce((a, b) => a < b ? a : b);
    return (min - 5).floorToDouble();
  }

  double _calculateMaxY() {
    if (temperatureData.isEmpty) return 50;
    final max = temperatureData.reduce((a, b) => a > b ? a : b);
    return (max + 5).ceilToDouble();
  }
}
