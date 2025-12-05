import 'package:course_package/src/enums/course_category.dart';
import 'package:course_package/src/enums/course_type.dart';
import 'package:course_package/src/enums/difficulty_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

/// A model representing a course offering.
///
/// Uses Freezed for immutability and JSON serialization. Provides computed
/// properties for course type and pricing.
@freezed
abstract class Course with _$Course {
  const Course._();

  /// Creates a course item with the specified details.
  factory Course.item({
    required String id,
    required String title,
    required String description,
    required DateTime dateAdded,
    required DateTime startDate,
    required double ceus,
    required double price,
    required List<String> targetAudiences,
    required CourseCategory topic,
    required DifficultyLevel difficultyLevel,
    @Default(false) bool isLive,
    @Default(false) bool isPrerecordedWebinar,
    @Default(false) bool isGamifiedCourse,
    @Default(false) bool isFreeForMembers,
  }) = CourseItem;

  /// Creates a [Course] from a JSON map.
  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  /// Determines the [CourseType] based on course flags.
  ///
  /// Priority: live > recorded > gamified > monograph
  CourseType get courseType {
    if (isLive) {
      return CourseType.live;
    } else if (isPrerecordedWebinar) {
      return CourseType.recorded;
    } else if (isGamifiedCourse) {
      return CourseType.gamified;
    } else {
      return CourseType.monograph;
    }
  }

  /// Returns true if the course price is 0 or less.
  bool get isFree => price <= 0.0;
}
