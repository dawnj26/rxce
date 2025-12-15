part of 'course_list_bloc.dart';

@freezed
class CourseListEvent with _$CourseListEvent {
  const factory CourseListEvent.started() = _Started;
  const factory CourseListEvent.loadMore() = _LoadMore;
  const factory CourseListEvent.sortChanged(
    List<CourseSortOption> sortOptions,
  ) = _SortChanged;
  const factory CourseListEvent.filterChanged({
    CourseCategory? filterByTopic,
    CourseType? filterByType,
    CourseSortOption? sortOption,
  }) = _FilterChanged;
  const factory CourseListEvent.ceRequirementChanged(
    CeRequirement? ceRequirement,
  ) = _CeRequirementChanged;
}
