part of 'course_search_bloc.dart';

@freezed
abstract class CourseSearchState with _$CourseSearchState {
  const factory CourseSearchState.initial({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<String> suggestions,
    @Default('') String query,
    String? errorMessage,
  }) = _Initial;
}
