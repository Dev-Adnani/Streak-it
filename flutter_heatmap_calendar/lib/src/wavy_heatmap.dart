import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:flutter_heatmap_calendar/src/util/datasets_util.dart';

class WavyHeatmap extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final Map<int, Color> colorsets;
  final Color defaultColor;
  final DateTime startDate;
  final double size;
  final double borderRadius;
  final bool showText;
  final ColorMode colorMode;

  const WavyHeatmap({
    required this.datasets,
    required this.colorsets,
    required this.defaultColor,
    required this.startDate,
    required this.size,
    required this.borderRadius,
    required this.showText,
    required this.colorMode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(7 * size * 2, size * 4), // Width for 7 days
      painter: WavyHeatmapPainter(
        datasets: datasets,
        colorsets: colorsets,
        defaultColor: defaultColor,
        size: size,
        borderRadius: borderRadius,
        colorMode: colorMode,
        startDate: startDate,
      ),
    );
  }
}

class WavyHeatmapPainter extends CustomPainter {
  final Map<DateTime, int>? datasets;
  final Map<int, Color> colorsets;
  final Color defaultColor;
  final double size;
  final double borderRadius;
  final ColorMode colorMode;
  final DateTime startDate;

  WavyHeatmapPainter({
    required this.datasets,
    required this.colorsets,
    required this.defaultColor,
    required this.size,
    required this.borderRadius,
    required this.colorMode,
    required this.startDate,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    const waveHeight = 20.0; // Amplitude of wave

    for (int i = 1; i < 8; i++) {
      final date = _normalizeDate(startDate.add(Duration(days: i)));
      final dataValue = datasets?[date];

      // Map dataValue to color
      final color = (dataValue != null && dataValue > 0)
          ? _getColor(dataValue) // Use dataset value to calculate color
          : defaultColor.withValues(
              alpha: 0.2); // Light opacity for missing data
      paint.color = color;

      // Calculate position for wavy pattern
      final x = i * this.size * 2;
      final y = sin(i * pi / 3) * waveHeight + size.height / 2;

      // Draw block with calculated color and position
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(x, y), width: this.size, height: this.size),
          Radius.circular(borderRadius),
        ),
        paint,
      );
    }
  }

  // Normalize DateTime to remove the time component (set to midnight).
  DateTime _normalizeDate(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  Color _getColor(int? value) {
    if (value == null || value == 0) {
      return defaultColor.withValues(
          alpha: 0.2); // Light opacity for missing data
    }
    if (colorMode == ColorMode.opacity) {
      final maxValue = colorsets.keys.reduce(max);
      final opacity = value / maxValue;
      return colorsets.values.first.withValues(alpha: opacity);
    } else {
      return DatasetsUtil.getColor(colorsets, value) ?? defaultColor;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
