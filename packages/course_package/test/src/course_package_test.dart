import 'package:api_package/api_package.dart';
import 'package:course_package/src/api/course_api.dart';
import 'package:course_package/src/course_package.dart';
import 'package:course_package/src/enums/enums.dart';
import 'package:course_package/src/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCourseApi extends Mock implements CourseApi {}

void main() {
  group('CoursePackage', () {
    late MockCourseApi mockApi;
    late CoursePackage coursePackage;

    setUp(() {
      mockApi = MockCourseApi();
      coursePackage = CoursePackage(courseApi: mockApi);
    });

    group('getCourses', () {
      test('delegates to api with correct parameters', () async {
        final mockResponse = PaginatedResponse<CourseItem>(
          items: [],
          total: 0,
          page: 1,
          pageSize: 10,
        );

        when(
          () => mockApi.getCourses(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
            filterByType: any(named: 'filterByType'),
            filterByTopic: any(named: 'filterByTopic'),
          ),
        ).thenAnswer((_) async => mockResponse);

        final result = await coursePackage.getCourses(
          page: 2,
          pageSize: 20,
          filterByType: CourseType.live,
          filterByTopic: CourseCategory.drugTherapy,
        );

        expect(result, mockResponse);
        verify(
          () => mockApi.getCourses(
            page: 2,
            pageSize: 20,
            filterByType: CourseType.live,
            filterByTopic: CourseCategory.drugTherapy,
          ),
        ).called(1);
      });

      test('uses default parameters when not specified', () async {
        final mockResponse = PaginatedResponse<CourseItem>(
          items: [],
          total: 0,
          page: 1,
          pageSize: 10,
        );

        when(
          () => mockApi.getCourses(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
            filterByType: any(named: 'filterByType'),
            filterByTopic: any(named: 'filterByTopic'),
          ),
        ).thenAnswer((_) async => mockResponse);

        await coursePackage.getCourses();

        verify(
          () => mockApi.getCourses(),
        ).called(1);
      });
    });

    group('constructor', () {
      test('uses provided CourseApi', () {
        final customApi = MockCourseApi();
        final package = CoursePackage(courseApi: customApi);

        expect(package, isNotNull);
      });

      test('creates default CourseApi when none provided', () {
        final package = CoursePackage();

        expect(package, isNotNull);
      });
    });
  });
}
