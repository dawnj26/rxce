import 'package:course_package/course_package.dart';

enum SortOption {
  aToZliveFirst,
  aToZ,
  hoursHighToLow,
  newest;

  String get label {
    switch (this) {
      case SortOption.aToZliveFirst:
        return 'A to Z (Live First)';
      case SortOption.aToZ:
        return 'A to Z';
      case SortOption.hoursHighToLow:
        return 'Hours (High to Low)';
      case SortOption.newest:
        return 'Date Added (Newest)';
    }
  }

  List<CourseSortOption> get options {
    switch (this) {
      case SortOption.aToZliveFirst:
        return [
          CourseSortOption.freeFirst,
          CourseSortOption.liveFirst,
          CourseSortOption.nameAsc,
        ];
      case SortOption.aToZ:
        return [CourseSortOption.freeFirst, CourseSortOption.nameAsc];
      case SortOption.hoursHighToLow:
        return [CourseSortOption.freeFirst, CourseSortOption.hoursDesc];
      case SortOption.newest:
        return [CourseSortOption.freeFirst, CourseSortOption.dateAddedNewest];
    }
  }
}
