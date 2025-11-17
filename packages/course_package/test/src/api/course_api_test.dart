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

    group('getCourseById', () {
      test('returns course when ID exists', () async {
        final course = await courseApi.getCourseById('2');

        expect(course, isNotNull);
        expect(course!.id, '2');
        expect(course.title, 'HIV/AIDS Treatment Update 2024');
      });

      test('returns null when ID does not exist', () async {
        final course = await courseApi.getCourseById('nonexistent-id');

        expect(course, isNull);
      });

      test('returns correct course for various IDs', () async {
        final course5 = await courseApi.getCourseById('5');
        final course10 = await courseApi.getCourseById('10');

        expect(course5?.id, '5');
        expect(course10?.id, '10');
      });
    });

    group('searchCourses', () {
      test('finds courses by title', () async {
        final results = await courseApi.searchCourses('Diabetes');

        expect(results.items.isNotEmpty, true);
        expect(
          results.items.any((c) => c.title.contains('Diabetes')),
          true,
        );
      });

      test('finds courses by description', () async {
        final results = await courseApi.searchCourses('patient care');

        expect(results.items.isNotEmpty, true);
        expect(
          results.items.any(
            (c) => c.description.toLowerCase().contains('patient care'),
          ),
          true,
        );
      });

      test('is case insensitive', () async {
        final lowerCase = await courseApi.searchCourses('diabetes');
        final upperCase = await courseApi.searchCourses('DIABETES');
        final mixedCase = await courseApi.searchCourses('DiAbEtEs');

        expect(lowerCase.items.length, upperCase.items.length);
        expect(lowerCase.items.length, mixedCase.items.length);
      });

      test('returns empty list when no matches found', () async {
        final results = await courseApi.searchCourses('xyzabc123nonexistent');

        expect(results, isEmpty);
      });

      test('returns multiple matching courses', () async {
        final results = await courseApi.searchCourses('Pharmacist');

        expect(results.items.length, greaterThan(1));
      });
    });

    group('getFeaturedCourses', () {
      test('returns featured courses with default limit', () async {
        final results = await courseApi.getFeaturedCourses();

        expect(results.length, lessThanOrEqualTo(5));
        for (final course in results) {
          expect(
            course.isFreeForMembers || course.price < 50,
            true,
          );
        }
      });

      test('respects custom limit', () async {
        final results = await courseApi.getFeaturedCourses(limit: 3);

        expect(results.length, lessThanOrEqualTo(3));
      });

      test('only returns free or low-priced courses', () async {
        final results = await courseApi.getFeaturedCourses(limit: 20);

        for (final course in results) {
          expect(
            course.isFreeForMembers || course.price < 50,
            true,
            reason: 'Course ${course.id} should be free for members or < \$50',
          );
        }
      });

      test('returns empty list when limit is 0', () async {
        final results = await courseApi.getFeaturedCourses(limit: 0);

        expect(results, isEmpty);
      });
    });
  });
}
