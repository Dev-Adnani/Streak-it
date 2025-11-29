import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:streakit/ui/common/app.colors.dart';

class FontSizes {
  static double get scale => 1;
  static double get s8 => 8 * scale;
  static double get s10 => 10 * scale;
  static double get s11 => 11 * scale;
  static double get s12 => 12 * scale;
  static double get s13 => 13 * scale;
  static double get s14 => 14 * scale;
  static double get s16 => 16 * scale;
  static double get s18 => 18 * scale;
  static double get s20 => 20 * scale;
  static double get s22 => 22 * scale;
  static double get s24 => 24 * scale;
  static double get s28 => 28 * scale;
  static double get s34 => 34 * scale;
  static double get s38 => 38 * scale;
}

class AppTextStyles {
  // Base style for Inter
  static TextStyle manRopeStyle = GoogleFonts.manrope(
    fontWeight: FontWeight.w400,
    height: 1,
  );

  // Display styles
  static TextStyle get displayLarge => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s38,
        color: AppColors.creamColor,
        height: 1.2,
      );

  static TextStyle get displayMedium => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s34,
        color: AppColors.creamColor,
        height: 1.2,
      );

  static TextStyle get displaySmall => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s28,
        color: AppColors.creamColor,
        height: 1.25,
      );

  // Headline styles
  static TextStyle get headlineLarge => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s24,
        color: AppColors.creamColor,
        height: 1.3,
      );

  static TextStyle get headlineMedium => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s20,
        color: AppColors.creamColor,
        height: 1.3,
      );

  static TextStyle get headlineSmall => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s18,
        color: AppColors.creamColor,
        height: 1.4,
      );

  // Title styles
  static TextStyle get titleLarge => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s16,
        color: AppColors.creamColor,
        height: 1.4,
      );

  static TextStyle get titleMedium => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s14,
        color: AppColors.creamColor,
        height: 1.4,
      );

  static TextStyle get titleSmall => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s13,
        color: AppColors.creamColor,
        height: 1.5,
      );

  // Body styles
  static TextStyle get bodyText1 => manRopeStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.s18,
        color: AppColors.creamColor,
        height: 1.5,
      );

  static TextStyle get bodyText2 => manRopeStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.s16,
        color: AppColors.creamColor,
        height: 1.5,
      );

  static TextStyle get bodyText3 => manRopeStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.s14,
        color: AppColors.creamColor,
        height: 1.5,
      );

  static TextStyle get bodyText4 => manRopeStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.s13,
        color: AppColors.creamColor,
        height: 1.5,
      );

  static TextStyle get bodyText5 => manRopeStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.s12,
        color: AppColors.creamColor,
        height: 1.5,
      );

  static TextStyle get bodyText6 => manRopeStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.s10,
        color: AppColors.creamColor,
        height: 1.5,
      );

  // Label styles
  static TextStyle get labelLarge => manRopeStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: FontSizes.s14,
        color: AppColors.creamColor,
        height: 1.5,
      );

  static TextStyle get labelMedium => manRopeStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.s12,
        color: AppColors.creamColor,
        height: 1.5,
      );

  static TextStyle get labelSmall => manRopeStyle.copyWith(
        fontWeight: FontWeight.normal,
        fontSize: FontSizes.s10,
        color: AppColors.creamColor,
        height: 1.5,
      );

  // Additional styles
  static TextStyle get button => headlineSmall;

  static TextStyle get overline => labelSmall;

  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        displaySmall: displaySmall,
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        titleMedium: titleMedium,
        titleSmall: titleSmall,
        bodyLarge: bodyText1, // Mapping bodyText1 to bodyLarge
        bodyMedium: bodyText2, // Mapping bodyText2 to bodyMedium
        bodySmall: bodyText3, // Mapping bodyText3 to bodySmall
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      );
}
