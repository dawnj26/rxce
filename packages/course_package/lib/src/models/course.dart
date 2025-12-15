//
// ignore_for_file: invalid_annotation_target

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
    required int id,
    required String testNumber,
    required String testName,
    required String testNameShort,
    required double credits,
    required String uan,
    required DateTime dateAdded,
    required DateTime startDate,
    required DateTime expires,
    @JsonKey(name: 'courseDescription') required String description,
    @JsonKey(name: 'difficultyLevel') required String difficulty,
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

  /// Converts the UAN string to [CourseCategory] enum.
  CourseCategory get topic => CourseCategory.fromUan(uan);

  /// Converts the string difficulty level to [DifficultyLevel] enum.
  DifficultyLevel get difficultyLevel => DifficultyLevel.fromString(difficulty);
}
