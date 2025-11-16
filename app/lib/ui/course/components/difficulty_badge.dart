import 'package:app/ui/course/components/text_badge.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';

class DifficultyBadge extends StatelessWidget {
  const DifficultyBadge({required this.level, super.key});

  final DifficultyLevel level;

  @override
  Widget build(BuildContext context) {
    return TextBadge(text: level.label);
  }
}
