import 'package:api_package/api_package.dart';
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
  }) : _api = courseApi ?? CourseApi();

  final CourseApi _api;

  /// Fetch courses with pagination
  Future<PaginatedResponse<CourseItem>> getCourses({
    int page = 1,
    int pageSize = 10,
    CourseType? filterByType,
    CourseCategory? filterByTopic,
    CourseSortOption? sortBy,
    String? query,
    CeRequirement? ceRequirement,
  }) {
    return _api.getCourses(
      page: page,
      pageSize: pageSize,
      filterByType: filterByType,
      filterByTopic: filterByTopic,
      sortBy: sortBy,
      query: query,
      ceRequirement: ceRequirement,
    );
  }
}
