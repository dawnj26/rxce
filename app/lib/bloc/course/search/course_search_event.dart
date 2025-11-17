part of 'course_search_bloc.dart';

@freezed
abstract class CourseSearchEvent with _$CourseSearchEvent {
  const factory CourseSearchEvent.queryChanged(String query) = _QueryChanged;
}
