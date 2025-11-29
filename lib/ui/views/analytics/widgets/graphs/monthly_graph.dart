import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:streakit/ui/common/app.colors.dart';

class MonthlyCompletionsGraph extends StatelessWidget {
  final List<int> completions;
  final List<String> months;

  const MonthlyCompletionsGraph({
    super.key,
    required this.completions,
    required this.months,
  });

  @override
  Widget build(BuildContext context) {
    // Filter data to only include items with visible labels
    final filteredData = <int, String>{};

    for (int i = 0; i < months.length; i++) {
      // Skip data points if the total count exceeds 10 and it's an odd index
      if (months.length > 10 && i % 2 != 0) {
        continue;
      }
      filteredData[i] = months[i];
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
                  color: AppColors.rosyBrown,
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
                        .shrink(); // Hide labels for skipped data
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      filteredData[index]!,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  );
                },
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
