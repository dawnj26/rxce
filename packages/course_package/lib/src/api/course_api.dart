import 'dart:developer';

import 'package:api_package/api_package.dart';
import 'package:course_package/src/enums/enums.dart';
import 'package:course_package/src/models/models.dart';

/// {@template course_api}
/// API client for course-related operations.
///
/// Provides methods to fetch, search, and
/// filter courses with pagination support.
/// {@endtemplate}
class CourseApi {
  /// Creates a new instance of [CourseApi].
  CourseApi({
    ApiPackage? apiPackage,
  }) : _api = apiPackage ?? ApiPackage.instance;

  final ApiPackage _api;

  /// Fetches courses with optional filtering and sorting.
  ///
  /// Returns a paginated response containing courses matching the criteria.
  /// Defaults to page 1 with 10 items per page.
  Future<PaginatedResponse<CourseItem>> getCourses({
    int page = 1,
    int pageSize = 16,
    CourseType? filterByType,
    CourseCategory? filterByTopic,
    CourseSortOption? sortBy,
    String? query,
    CeRequirement? ceRequirement,
  }) async {
    try {
      final response = await _api.v1.getCourses(
        filterTopic: filterByTopic?.label,
        pageNumber: page,
        pageSize: pageSize,
        sortBy: sortBy?.code,
        testType: filterByType?.id,
        searchString: query,
        state: ceRequirement?.state,
        profession: ceRequirement?.profession,
      );

      final courses = response.data!['courses'] as List<dynamic>;
      final totalCount = response.data!['totalCount'] as int;
      final pageNumber = response.data!['pageNumber'] as int;
      final pageSizeResp = response.data!['pageSize'] as int;

      final courseItems = courses
          .map((json) => CourseItem.fromJson(json as Map<String, dynamic>))
          .toList();

      return PaginatedResponse<CourseItem>(
        items: courseItems,
        totalCount: totalCount,
        page: pageNumber,
        pageSize: pageSizeResp,
      );
    } on Exception catch (e) {
      log('Error fetching courses: $e');
      rethrow;
    }
  }
}
