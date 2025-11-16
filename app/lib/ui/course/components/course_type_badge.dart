import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

extension CourseTypeColors on CourseType {
  MaterialColor get color {
    switch (this) {
      case CourseType.live:
        return Colors.red;
      case CourseType.recorded:
        return Colors.green;
      case CourseType.gamified:
        return Colors.purple;
      case CourseType.monograph:
        return Colors.blue;
    }
  }
}

extension CourseTypeIcons on CourseType {
  IconData get icon {
    switch (this) {
      case CourseType.live:
        return FontAwesomeIcons.video;
      case CourseType.recorded:
        return FontAwesomeIcons.circlePlay;
      case CourseType.gamified:
        return FontAwesomeIcons.gamepad;
      case CourseType.monograph:
        return FontAwesomeIcons.book;
    }
  }
}

class CourseTypeBadge extends StatelessWidget {
  const CourseTypeBadge({required this.type, super.key});

  final CourseType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            type.icon,
            color: type.color.shade50,
            size: 12,
          ),
          const SizedBox(width: 6),
          Text(
            type.label,
            style: TextStyle(
              color: type.color.shade50,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
