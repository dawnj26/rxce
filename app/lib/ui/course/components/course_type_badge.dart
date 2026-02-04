import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:theme_package/theme_package.dart';

extension CourseTypeIcons on CourseType {
  IconData get icon {
    switch (this) {
      case CourseType.live:
        return LucideIcons.radio;
      case CourseType.recorded:
        return LucideIcons.video;
      case CourseType.gamified:
        return LucideIcons.gamepad;
      case CourseType.monograph:
        return LucideIcons.bookText;
    }
  }
}

class CourseTypeBadge extends StatelessWidget {
  const CourseTypeBadge({required this.type, super.key});

  final CourseType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(
          type.icon,
          color: context.appColor.primary.shade500,
          size: 12,
        ),
        const SizedBox(width: 6),
        Text(
          type.label,
          style: context.appText.labelSmall.copyWith(
            color: context.appColor.primary.shade500,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
