import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rxce/shared/components/components.dart';
import 'package:rxce/ui/course/components/components.dart';

class CourseTypeFilterCard extends StatelessWidget {
  const CourseTypeFilterCard({
    required this.type,
    this.isSelected = false,
    super.key,
    this.onTap,
  });

  final CourseType type;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SelectCard(
      isSelected: isSelected,
      onTap: onTap,
      child: Row(
        children: [
          FaIcon(type.icon, size: 16),
          const SizedBox(width: 8),
          Text(
            type.label,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
