/// Represents the type/format of a course.
enum CourseType {
  /// A written course or monograph format.
  monograph,

  /// A previously recorded webinar or course session.
  recorded,

  /// A real-time interactive course session.
  live,

  /// An interactive course with game mechanics and engagement elements.
  gamified
  ;

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

  /// Returns the unique ID associated with this course type.
  int get id {
    switch (this) {
      case CourseType.monograph:
        return 0;
      case CourseType.recorded:
        return 1;
      case CourseType.live:
        return 2;
      case CourseType.gamified:
        return 3;
    }
  }
}
