/// Represents the difficulty level of a course.
enum DifficultyLevel {
  /// Suitable for learners new to the subject matter.
  beginner,

  /// Suitable for learners with basic
  /// knowledge seeking to deepen understanding.
  intermediate,

  /// Suitable for experienced learners tackling complex concepts.
  advanced;

  /// Returns the human-readable label for this difficulty level.
  String get label {
    switch (this) {
      case DifficultyLevel.beginner:
        return 'Beginner';
      case DifficultyLevel.intermediate:
        return 'Intermediate';
      case DifficultyLevel.advanced:
        return 'Advanced';
    }
  }
}
