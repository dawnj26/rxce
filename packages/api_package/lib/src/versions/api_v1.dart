import 'package:api_package/src/versions/base_api_version.dart';
import 'package:dio/dio.dart';

/// {@template api_v1}
/// API v1 client
/// {@endtemplate}
class ApiV1 extends BaseApiVersion {
  /// {@macro api_v1}
  ApiV1(Dio dio) : super(dio: dio);

  @override
  String? get versionPrefix => null;

  /// Fetch list of courses
  ///
  /// Optional parameters can be used to filter and sort the results.
  /// - [state]: Filter by state
  /// - [searchString]: Search term to filter courses
  /// - [filterCategoryId]: Filter by category ID
  /// - [filterTopic]: Filter by topic ID
  /// - [testType]: Filter by test type
  /// - [sortBy]: Sort order
  /// - [pageNumber]: Page number for pagination
  /// - [pageSize]: Number of items per page
  Future<Response<Map<String, dynamic>>> getCourses({
    String? state,
    String? searchString,
    int? filterCategoryId,
    String? filterTopic,
    int? testType,
    String? sortBy,
    int? pageNumber,
    int? pageSize,
    String? profession,
  }) {
    final queryParameters = <String, dynamic>{
      'state': ?state,
      'searchString': ?searchString,
      'filterCategoryId': ?filterCategoryId,
      'filterTopic': ?filterTopic,
      'testType': ?testType,
      'sortBy': ?sortBy,
      'pageNumber': ?pageNumber,
      'pageSize': ?pageSize,
      'profession': ?profession,
    };

    return get('/courselistapi', queryParameters: queryParameters);
  }
}
