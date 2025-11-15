import 'package:course_package/src/enums/course_category.dart';
import 'package:course_package/src/enums/course_type.dart';
import 'package:course_package/src/enums/difficulty_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
abstract class Course with _$Course {
  const Course._();

  factory Course.item({
    required String id,
    required String title,
    required String description,
    required DateTime dateAdded,
    required DateTime startDate,
    required double ceus,
    required double price,
    required List<String> targetAudiences,
    required CourseTopic topic,
    required DifficultyLevel difficultyLevel,
    @Default(false) bool isLive,
    @Default(false) bool isPrerecordedWebinar,
    @Default(false) bool isGamifiedCourse,
    @Default(false) bool isFreeForMembers,
  }) = CourseItem;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

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

  bool get isFree => price <= 0.0;
}
