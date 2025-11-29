// ignore_for_file: equal_keys_in_map
import 'package:flutter/material.dart';

class AppColors {
  static const Color blackColor = Color(0xFF17181A);
  static const Color creamColor = Color(0xfff5f5ff);
  static const Color rawSienna = Color(0xffd7834f);
  static const Color yellowish = Color(0xffE7B975);
  static const Color greenish = Color(0xff4CAF50);
  static const Color iceBlue = Color(0xFF9CF6F6);
  static const Color icePink = Color(0xFFE6B3B3);
  static const Color greyish = Color(0xFFB0B0B0);
  static const Color burntSienna = Color(0xffE97451);
  static const Color peru = Color(0xffCD853F);
  static const Color darkGoldenrod = Color(0xffB8860B);
  static const Color rosyBrown = Color(0xffBC8F8F);
  static const Color darkOliveGreen = Color(0xff556B2F);
  static const Color indianRed = Color(0xffCD5C5C);
  static const Color navyBlue = Color(0xFF001F3F);
  static const Color coral = Color(0xFFFF7F50);
  static const Color teal = Color(0xFF008080);
  static const Color mustard = Color(0xFFFFDB58);
  static const Color plum = Color(0xFFDDA0DD);
  static const Color forestGreen = Color(0xFF228B22);
  static const Color slateBlue = Color(0xFF6A5ACD);
  static const Color lightCoral = Color(0xFFF08080);
  static const Color lightRed = Color(0xFFCD5C5C);
  static const Color lightGreen = Color(0xFF228B22);
  static const Color lightYellow = Color(0xffE7B975);

  static List<Color> getHabitColorList = [
    creamColor,
    yellowish,
    lightYellow,
    lightCoral,
    rawSienna,
    coral,
    burntSienna,
    darkGoldenrod,
    darkOliveGreen,
    forestGreen,
    plum,
    indianRed,
    rosyBrown,
    slateBlue
  ];

  // Map to associate each color with its name
  static final Map<Color, String> colorNameMap = {
    blackColor: "blackColor",
    creamColor: "creamColor",
    rawSienna: "rawSienna",
    yellowish: "yellowish",
    greenish: "greenish",
    iceBlue: "iceBlue",
    icePink: "icePink",
    greyish: "greyish",
    burntSienna: "burntSienna",
    peru: "peru",
    darkGoldenrod: "darkGoldenrod",
    rosyBrown: "rosyBrown",
    darkOliveGreen: "darkOliveGreen",
    indianRed: "indianRed",
    navyBlue: "navyBlue",
    coral: "coral",
    teal: "teal",
    mustard: "mustard",
    plum: "plum",
    forestGreen: "forestGreen",
    slateBlue: "slateBlue",
    lightCoral: "lightCoral",
    lightRed: "lightRed",
    lightGreen: "lightGreen",
    lightYellow: "lightYellow",
  };

  static int getColorIndexByName(String? colorName) {
    // Find the color corresponding to the name
    Color? color = colorNameMap.entries
        .firstWhere(
          (entry) => entry.value == colorName,
          orElse: () => MapEntry(Colors.transparent, ''), // Dummy fallback
        )
        .key;

    // If the color exists in the map, find its index in the habit color list
    if (color != Colors.transparent) {
      return getHabitColorList.indexOf(color);
    }

    // Return -1 if the color is not found
    return 0;
  }

  static Color getColorByName(String colorName) {
    // Find the color in the map based on the name
    return colorNameMap.entries
        .firstWhere(
          (entry) => entry.value == colorName,
          orElse: () => MapEntry(Colors.transparent, ''), // Fallback
        )
        .key;
  }
}
