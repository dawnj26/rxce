/// Represents the available sorting options for courses.
enum CourseSortOption {
  /// Prioritize live courses first.
  liveFirst,

  /// Sort by course title in ascending (A-Z) order.
  nameAsc,

  /// Sort by Credit Hours in descending order.
  hoursDesc,

  /// Sort by date added with newest first.
  dateAddedNewest
  ;

  /// Returns the code associated with this sort option for API requests.
  String? get code {
    switch (this) {
      case CourseSortOption.nameAsc:
        return 'AZ';
      case CourseSortOption.liveFirst:
        return null;
      case CourseSortOption.hoursDesc:
        return 'CH';
      case CourseSortOption.dateAddedNewest:
        return 'DA';
    }
  }

  /// Returns the human-readable label for this sort option.
  String get label {
    switch (this) {
      case CourseSortOption.nameAsc:
        return 'Name (A-Z)';
      case CourseSortOption.liveFirst:
        return 'Live First (A-Z)';
      case CourseSortOption.hoursDesc:
        return 'Credit Hours (High to Low)';
      case CourseSortOption.dateAddedNewest:
        return 'Date Added (Newest)';
    }
  }
}
