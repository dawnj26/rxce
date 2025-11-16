import 'package:app/ui/course/components/category_filter_card.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';

class CategoryFilterList extends StatelessWidget {
  const CategoryFilterList({
    required this.selected,
    required this.categories,
    super.key,
    this.onSelected,
  });

  final List<CourseCategory> categories;
  final CourseCategory? selected;
  final void Function(CourseCategory category)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(
        12,
        12,
        12,
        12,
      ),
      itemBuilder: (c, i) {
        final category = categories[i];
        final isSelected = category == selected;

        return CategoryFilterCard(
          isSelected: isSelected,
          category: category,
          onTap: () => onSelected?.call(category),
        );
      },
      itemCount: categories.length,
    );
  }
}
