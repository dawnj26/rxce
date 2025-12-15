import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:rxce/ui/course/components/components.dart';

Future<void> showCourseFilterModal({
  required BuildContext context,
  CourseCategory? categoryFilter,
  CourseType? typeFilter,
  VoidCallback? onReset,
  CourseSortOption sortOption = CourseSortOption.liveFirst,
  void Function(CourseCategory?, CourseType?, CourseSortOption)? onApply,
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

Future<String?> showStateSelectionSheet(
  BuildContext context, {
  String? currentSelection,
}) async {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => SelectionSheet(
      title: 'Select State',
      items: CeRequirementData.states,
      currentSelection: currentSelection,
      searchHint: 'Search states...',
    ),
  );
}

Future<String?> showProfessionSelectionSheet(
  BuildContext context, {
  String? currentSelection,
}) async {
  return showModalBottomSheet<String>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => SelectionSheet(
      title: 'Select Profession',
      items: CeRequirementData.professions,
      currentSelection: currentSelection,
      searchHint: 'Search professions...',
    ),
  );
}
