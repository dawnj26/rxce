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
        final mockResponse = PaginatedResponse<Course>(
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
          filterByTopic: CourseTopic.drugTherapy,
        );

        expect(result, mockResponse);
        verify(
          () => mockApi.getCourses(
            page: 2,
            pageSize: 20,
            filterByType: CourseType.live,
            filterByTopic: CourseTopic.drugTherapy,
          ),
        ).called(1);
      });

      test('uses default parameters when not specified', () async {
        final mockResponse = PaginatedResponse<Course>(
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

    group('getCourseById', () {
      test('delegates to api and returns course', () async {
        final mockCourse = Course.fromJson({
          'id': '1',
          'title': 'Test Course',
          'description': 'Test Description',
          'dateAdded': DateTime.now().toIso8601String(),
          'ceus': 2.0,
          'price': 49.99,
          'targetAudiences': ['Pharmacists'],
          'topic': 'drugTherapy',
          'isLive': false,
          'isPrerecordedWebinar': false,
          'isGamifiedCourse': false,
          'isFreeForMembers': false,
        });

        when(
          () => mockApi.getCourseById('1'),
        ).thenAnswer((_) async => mockCourse);

        final result = await coursePackage.getCourseById('1');

        expect(result, mockCourse);
        verify(() => mockApi.getCourseById('1')).called(1);
      });

      test('returns null when course not found', () async {
        when(
          () => mockApi.getCourseById('nonexistent'),
        ).thenAnswer((_) async => null);

        final result = await coursePackage.getCourseById('nonexistent');

        expect(result, isNull);
        verify(() => mockApi.getCourseById('nonexistent')).called(1);
      });
    });

    group('searchCourses', () {
      test('delegates to api with search query', () async {
        final mockCourses = <Course>[];

        when(
          () => mockApi.searchCourses('diabetes'),
        ).thenAnswer((_) async => mockCourses);

        final result = await coursePackage.searchCourses('diabetes');

        expect(result, mockCourses);
        verify(() => mockApi.searchCourses('diabetes')).called(1);
      });

      test('handles empty search results', () async {
        when(() => mockApi.searchCourses('xyz123')).thenAnswer((_) async => []);

        final result = await coursePackage.searchCourses('xyz123');

        expect(result, isEmpty);
      });
    });

    group('getFeaturedCourses', () {
      test('delegates to api with default limit', () async {
        final mockCourses = <Course>[];

        when(
          () => mockApi.getFeaturedCourses(limit: any(named: 'limit')),
        ).thenAnswer((_) async => mockCourses);

        final result = await coursePackage.getFeaturedCourses();

        expect(result, mockCourses);
        verify(() => mockApi.getFeaturedCourses()).called(1);
      });

      test('delegates to api with custom limit', () async {
        final mockCourses = <Course>[];

        when(
          () => mockApi.getFeaturedCourses(limit: any(named: 'limit')),
        ).thenAnswer((_) async => mockCourses);

        final result = await coursePackage.getFeaturedCourses(limit: 10);

        expect(result, mockCourses);
        verify(() => mockApi.getFeaturedCourses(limit: 10)).called(1);
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
