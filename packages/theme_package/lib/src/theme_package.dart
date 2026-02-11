import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_package/src/themes/themes.dart';

/// {@template theme_package}
/// A Flutter package providing theming capabilities for the RXCE application.
/// {@endtemplate}
class ThemePackage {
  const ThemePackage._();

  /// Default light theme data
  static ThemeData light() {
    final textTheme = AppTextTheme.light();

    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorTheme.light.neutral.shade50,
        foregroundColor: AppColorTheme.light.neutral.shade900,
        elevation: 0,
        titleTextStyle: textTheme.heading5.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColorTheme.light.neutral.shade900,
        ),
      ),
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColorTheme.light.primary.shade500,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(
            textTheme.labelLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          overlayColor: WidgetStatePropertyAll(
            AppColorTheme.light.primary.shade700,
          ),
          backgroundColor: WidgetStateProperty.fromMap({
            WidgetState.disabled: AppColorTheme.light.neutral.shade200,
            WidgetState.any: AppColorTheme.light.primary.shade500,
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
        textTheme,
      ],
    );
  }

  /// Default padding value
  static const double padding = 16;
}
