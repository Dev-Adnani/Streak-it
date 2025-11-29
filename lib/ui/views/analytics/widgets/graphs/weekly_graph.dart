import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';

class WeeklyTrendsGraph extends StatelessWidget {
  final List<int> completions;
  final List<String> days;

  const WeeklyTrendsGraph({
    super.key,
    required this.completions,
    required this.days,
  });

  @override
  Widget build(BuildContext context) {
    // Abbreviate days if necessary (e.g., "Monday" -> "Mon")
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
      child: BarChart(
        BarChartData(
          barGroups: filteredData.keys.map((index) {
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: completions[index].toDouble(),
                  color: AppColors.slateBlue,
                  width: 16,
                ),
              ],
            );
          }).toList(),
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
                interval: 1,
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
