import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:streakit/ui/common/app.colors.dart';

class StreakTrendsGraph extends StatelessWidget {
  final List<int> streaks;
  final List<String> days;

  const StreakTrendsGraph({
    super.key,
    required this.streaks,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    // Abbreviate days
    final abbreviatedDays = days.map((day) {
      if (day.length > 3) {
        return day.substring(0, 3); // Convert to "Mon", "Tue", etc.
      }
      return day;
    }).toList();

    // Filter data to only include items with visible labels
    final filteredData = <int, String>{};

    for (int i = 0; i < abbreviatedDays.length; i++) {
      // Skip data points if the total count exceeds 10 and it's an odd index
      if (abbreviatedDays.length > 10 && i % 2 != 0) {
        continue;
      }
      filteredData[i] = abbreviatedDays[i];
    }

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: filteredData.keys.map((index) {
                return FlSpot(
                  index.toDouble(),
                  streaks[index].toDouble(),
                );
              }).toList(),
              isCurved: true,
              color: AppColors.greenish,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.greenish.withOpacity(0.3),
              ),
            ),
          ],
          titlesData: FlTitlesData(
            show: true,
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  final int index = value.toInt();
                  if (!filteredData.containsKey(index)) {
                    return const SizedBox
                        .shrink(); // Skip labels for hidden data
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      filteredData[index]!,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  );
                },
                interval: 1, // Ensures labels only appear at set intervals
              ),
            ),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
