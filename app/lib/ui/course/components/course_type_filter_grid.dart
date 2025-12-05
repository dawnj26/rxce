import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:rxce/ui/course/components/components.dart';

class CourseTypeFilterGrid extends StatelessWidget {
  const CourseTypeFilterGrid({
    required this.selected,
    super.key,
    this.onSelected,
  });

  final CourseType? selected;
  final void Function(CourseType type)? onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.fromLTRB(
        12,
        12,
        12,
        12,
      ),
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: 3,
      children: CourseType.values
          .map(
            (type) => CourseTypeFilterCard(
              type: type,
              isSelected: type == selected,
              onTap: () => onSelected?.call(type),
            ),
          )
          .toList(),
    );
  }
}
