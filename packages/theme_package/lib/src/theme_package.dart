import 'package:flutter/material.dart';
import 'package:theme_package/src/themes/themes.dart';

/// {@template theme_package}
/// A Flutter package providing theming capabilities for the RXCE application.
/// {@endtemplate}
class ThemePackage {
  const ThemePackage._();

  /// Default light theme data
  static ThemeData get light => ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColorTheme.light.primary.shade500,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        textStyle: AppTextTheme.light.labelLarge.copyWith(
          fontWeight: FontWeight.w700,
        ),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: AppColorTheme.light.primary.shade500,
        foregroundColor: AppColorTheme.light.primary.shade50,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColorTheme.light.primary.shade500,
          width: 2,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColorTheme.light.neutral.shade300,
        ),
      ),
    ),
    extensions: [
      AppColorTheme.light,
      AppTextTheme.light,
    ],
  );

  /// Default padding value
  static const double padding = 16;
}
