import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:rxce/shared/components/components.dart';

class CategoryFilterCard extends StatelessWidget {
  const CategoryFilterCard({
    required this.category,
    this.isSelected = false,
    this.onTap,
    super.key,
  });

  final CourseCategory category;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SelectCard(
      isSelected: isSelected,
      onTap: onTap,
      child: Text(
        category.label,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
