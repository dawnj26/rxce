part of 'course_list_bloc.dart';

@freezed
abstract class CourseListState with _$CourseListState {
  const factory CourseListState.initial({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default([]) List<CourseItem> courses,
    @Default(1) int currentPage,
    @Default(false) bool hasReachedMax,
    @Default(SortOption.aToZliveFirst) SortOption sortOption,
    CourseType? filterByType,
    CourseCategory? filterByTopic,
    String? errorMessage,
  }) = _Initial;
}
