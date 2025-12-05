/// Represents the type/format of a course.
enum CourseType {
  /// A real-time interactive course session.
  live,

  /// A previously recorded webinar or course session.
  recorded,

  /// An interactive course with game mechanics and engagement elements.
  gamified,

  /// A written course or monograph format.
  monograph;

  /// Returns the human-readable label for this course type.
  String get label {
    switch (this) {
      case CourseType.live:
        return 'Live';
      case CourseType.recorded:
        return 'Recorded';
      case CourseType.gamified:
        return 'Gamified';
      case CourseType.monograph:
        return 'Monograph';
    }
  }
}
