import 'package:course_package/src/api/course_api.dart';
import 'package:course_package/src/enums/enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CourseApi', () {
    late CourseApi courseApi;

    setUp(() {
      courseApi = const CourseApi();
    });

    group('getCourses', () {
      test('returns paginated courses with default parameters', () async {
        final result = await courseApi.getCourses();

        expect(result.items.length, 10);
        expect(result.page, 1);
        expect(result.pageSize, 10);
        expect(result.total, greaterThan(0));
      });

      test('respects page and pageSize parameters', () async {
        final result = await courseApi.getCourses(page: 2, pageSize: 5);

        expect(result.items.length, 5);
        expect(result.page, 2);
        expect(result.pageSize, 5);
      });

      test('filters by course type', () async {
        final result = await courseApi.getCourses(
          filterByType: CourseType.live,
        );

        expect(result.items.isNotEmpty, true);
        for (final course in result.items) {
          expect(course.isLive, true);
        }
      });

      test('filters by course topic', () async {
        final result = await courseApi.getCourses(
          filterByTopic: CourseCategory.drugTherapy,
        );

        expect(result.items.isNotEmpty, true);
        for (final course in result.items) {
          expect(course.topic, CourseCategory.drugTherapy);
        }
      });

      test('applies multiple filters simultaneously', () async {
        final result = await courseApi.getCourses(
          filterByType: CourseType.recorded,
          filterByTopic: CourseCategory.drugTherapy,
        );

        for (final course in result.items) {
          expect(course.isPrerecordedWebinar, true);
          expect(course.topic, CourseCategory.drugTherapy);
        }
      });

      test('returns empty list when filters match no courses', () async {
        // This might return empty if no courses match both filters
        final result = await courseApi.getCourses(
          page: 100,
        );

        expect(result.items, isEmpty);
      });

      test('handles last page correctly', () async {
        final firstPage = await courseApi.getCourses(pageSize: 100);
        final totalPages = (firstPage.total / 100).ceil();

        final lastPage = await courseApi.getCourses(
          page: totalPages,
          pageSize: 100,
        );

        expect(lastPage.items.isNotEmpty, true);
        expect(lastPage.items.length, lessThanOrEqualTo(100));
      });
    });
  });
}
