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
    scaffoldBackgroundColor: Colors.white,
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
        overlayColor: WidgetStatePropertyAll(
          AppColorTheme.light.primary.shade700,
        ),
        backgroundColor: WidgetStatePropertyAll(
          AppColorTheme.light.primary.shade500,
        ),
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
