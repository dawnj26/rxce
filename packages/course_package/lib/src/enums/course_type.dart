enum CourseType {
  live,
  recorded,
  gamified,
  monograph;

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
