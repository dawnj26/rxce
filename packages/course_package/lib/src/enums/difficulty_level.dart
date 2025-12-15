/// Represents the difficulty level of a course.
enum DifficultyLevel {
  /// Suitable for learners new to the subject matter.
  beginner,

  /// Suitable for learners with basic
  /// knowledge seeking to deepen understanding.
  intermediate,

  /// Suitable for experienced learners tackling complex concepts.
  advanced
  ;

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

  /// Converts a string to the corresponding [DifficultyLevel].
  static DifficultyLevel fromString(String level) {
    switch (level.toLowerCase()) {
      case 'beginner':
        return DifficultyLevel.beginner;
      case 'intermediate':
        return DifficultyLevel.intermediate;
      case 'advanced':
        return DifficultyLevel.advanced;
      default:
        throw ArgumentError('Unknown difficulty level: $level');
    }
  }
}
