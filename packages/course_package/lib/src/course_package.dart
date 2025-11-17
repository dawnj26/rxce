import 'package:course_package/src/api/api.dart';
import 'package:course_package/src/enums/enums.dart';
import 'package:course_package/src/models/models.dart';

/// {@template course_package}
/// Package course_package
/// {@endtemplate}
class CoursePackage {
  /// {@macro course_package}
  CoursePackage({
    CourseApi? courseApi,
  }) : _api = courseApi ?? const CourseApi();

  final CourseApi _api;

  /// Fetch courses with pagination
  Future<PaginatedResponse<CourseItem>> getCourses({
    int page = 1,
    int pageSize = 10,
    CourseType? filterByType,
    CourseCategory? filterByTopic,
    List<CourseSortOption>? sortBy,
  }) {
    return _api.getCourses(
      page: page,
      pageSize: pageSize,
      filterByType: filterByType,
      filterByTopic: filterByTopic,
      sortBy: sortBy,
    );
  }

  /// Fetch a single course by ID
  Future<CourseItem?> getCourseById(String id) {
    return _api.getCourseById(id);
  }

  /// Search courses by title or description
  Future<PaginatedResponse<CourseItem>> searchCourses(
    String query, {
    int page = 1,
    int pageSize = 10,
    CourseType? filterByType,
    CourseCategory? filterByTopic,
    List<CourseSortOption>? sortBy,
  }) {
    return _api.searchCourses(
      query,
      page: page,
      pageSize: pageSize,
      filterByType: filterByType,
      filterByTopic: filterByTopic,
      sortBy: sortBy,
    );
  }

  /// Get featured courses (free for members or on sale)
  Future<List<CourseItem>> getFeaturedCourses({int limit = 5}) {
    return _api.getFeaturedCourses(limit: limit);
  }
}
