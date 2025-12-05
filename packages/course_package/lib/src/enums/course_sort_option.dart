/// Represents the available sorting options for courses.
enum CourseSortOption {
  /// Sort by course title in ascending (A-Z) order.
  nameAsc,

  /// Sort by course title in descending (Z-A) order.
  nameDesc,

  /// Prioritize live courses first.
  liveFirst,

  /// Prioritize free courses first.
  freeFirst,

  /// Sort by CEU hours in ascending order.
  hoursAsc,

  /// Sort by CEU hours in descending order.
  hoursDesc,

  /// Sort by date added with newest first.
  dateAddedNewest,

  /// Sort by date added with oldest first.
  dateAddedOldest,
}
