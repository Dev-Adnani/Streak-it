import 'package:flutter/material.dart';

/// Helper function to generate color sets for the heatmap
Map<int, Color> generateColorSets(int completionsPerInterval, Color baseColor) {
  Map<int, Color> colorSets = {};

  for (int i = 0; i < completionsPerInterval; i++) {
    double opacity =
        (i + 1) / completionsPerInterval; // Gradually increases opacity
    colorSets[i] = baseColor.withValues(alpha: opacity.clamp(0.0, 1.0));
  }

  return colorSets;
}
