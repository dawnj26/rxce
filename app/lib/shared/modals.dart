import 'package:app/ui/course/components/course_filter_modal.dart';
import 'package:app/ui/course/models/sort_option.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';

Future<void> showCourseFilterModal({
  required BuildContext context,
  CourseCategory? categoryFilter,
  CourseType? typeFilter,
  VoidCallback? onReset,
  SortOption sortOption = SortOption.aToZliveFirst,
  void Function(CourseCategory?, CourseType?, SortOption)? onApply,
}) async {
  const double borderRadius = 12;

  await showModalBottomSheet<void>(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius),
      ),
    ),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext _) {
      return CourseFilterModal(
        selectedCategory: categoryFilter,
        selectedType: typeFilter,
        selectedSortOption: sortOption,
        onReset: onReset,
        onApply: onApply,
      );
    },
  );
}
