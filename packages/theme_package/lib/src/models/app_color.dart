import 'package:flutter/material.dart';

/// Model representing a color with multiple shades.
class AppColor {
  /// Creates an instance of [AppColor] with specified color shades.
  const AppColor({
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
    required this.shade950,
  });

  /// Color shade at 50 intensity.
  final Color shade50;

  /// Color shade at 100 intensity.
  final Color shade100;

  /// Color shade at 200 intensity.
  final Color shade200;

  /// Color shade at 300 intensity.
  final Color shade300;

  /// Color shade at 400 intensity.
  final Color shade400;

  /// Color shade at 500 intensity.
  final Color shade500;

  /// Color shade at 600 intensity.
  final Color shade600;

  /// Color shade at 700 intensity.
  final Color shade700;

  /// Color shade at 800 intensity.
  final Color shade800;

  /// Color shade at 900 intensity.
  final Color shade900;

  /// Color shade at 950 intensity.
  final Color shade950;
}
