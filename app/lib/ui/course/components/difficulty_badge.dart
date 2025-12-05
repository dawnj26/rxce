import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:rxce/ui/course/components/components.dart';

class DifficultyBadge extends StatelessWidget {
  const DifficultyBadge({required this.level, super.key});

  final DifficultyLevel level;

  @override
  Widget build(BuildContext context) {
    return TextBadge(text: level.label);
  }
}
