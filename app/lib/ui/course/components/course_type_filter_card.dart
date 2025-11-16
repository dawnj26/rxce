import 'package:app/ui/components/select_card.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';

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
      child: Text(
        type.label,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
