import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(
          AppTextTheme.light.labelLarge.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        overlayColor: const WidgetStatePropertyAll(
          Colors.transparent,
        ),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.pressed)) {
            return AppColorTheme.light.primary.shade600;
          }
          if (states.contains(WidgetState.disabled)) {
            return AppColorTheme.light.neutral.shade200;
          }
          return AppColorTheme.light.primary.shade500;
        }),
        foregroundColor: WidgetStateProperty.fromMap({
          WidgetState.disabled: AppColorTheme.light.neutral.shade400,
          WidgetState.any: AppColorTheme.light.primary.shade50,
        }),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
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
    textTheme: GoogleFonts.montserratTextTheme(),
    extensions: [
      AppColorTheme.light,
      AppTextTheme.light,
    ],
  );

  /// Default padding value
  static const double padding = 16;
}
