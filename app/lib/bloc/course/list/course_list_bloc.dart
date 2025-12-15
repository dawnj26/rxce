import 'dart:async';

import 'package:api_package/api_package.dart';
import 'package:bloc/bloc.dart';
import 'package:course_package/course_package.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxce/shared/loading_status.dart';
import 'package:rxce/shared/stream.dart';

part 'course_list_bloc.freezed.dart';
part 'course_list_event.dart';
part 'course_list_state.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  CourseListBloc({
    required CoursePackage coursePackage,
    CeRequirement? ceRequirement,
    String? query,
  }) : _coursePackage = coursePackage,
       super(
         _Initial(
           query: query,
           ceRequirement: ceRequirement,
         ),
       ) {
    on<_Started>(_onStarted);
    on<_LoadMore>(
      _onLoadMore,
      transformer: throttleDroppable(
        const Duration(milliseconds: 300),
      ),
    );
    on<_FilterChanged>(_onFilterChanged);
    on<_CeRequirementChanged>(_onCeRequirementChanged);
  }

  final CoursePackage _coursePackage;
  final int _itemsPerPage = 16;

  Future<void> _onStarted(
    _Started event,
    Emitter<CourseListState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));

    try {
      final response = await _fetchCourses(
        page: 1,
        filterByType: state.filterByType,
        filterByTopic: state.filterByTopic,
        sortBy: state.sortOption,
        query: state.query,
        ceRequirement: state.ceRequirement,
      );

      emit(
        state.copyWith(
          status: LoadingStatus.success,
          courses: response.items,
          hasReachedMax: !response.hasMore,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: LoadingStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onLoadMore(
    _LoadMore event,
    Emitter<CourseListState> emit,
  ) async {
    if (state.hasReachedMax) return;

    try {
      final nextPage = state.currentPage + 1;
      final response = await _fetchCourses(
        page: nextPage,
        filterByType: state.filterByType,
        filterByTopic: state.filterByTopic,
        sortBy: state.sortOption,
        query: state.query,
        ceRequirement: state.ceRequirement,
      );

      final hasReachedMax = response.items.isEmpty || !response.hasMore;

      emit(
        state.copyWith(
          status: LoadingStatus.success,
          courses: [...state.courses, ...response.items],
          currentPage: nextPage,
          hasReachedMax: hasReachedMax,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          status: LoadingStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onFilterChanged(
    _FilterChanged event,
    Emitter<CourseListState> emit,
  ) async {
    if (event.filterByTopic == state.filterByTopic &&
        event.filterByType == state.filterByType &&
        event.sortOption == state.sortOption) {
      return;
    }

    emit(
      state.copyWith(
        filterByTopic: event.filterByTopic,
        filterByType: event.filterByType,
        sortOption: event.sortOption ?? CourseSortOption.liveFirst,
        currentPage: 1,
        hasReachedMax: false,
      ),
    );
    add(const CourseListEvent.started());
  }

  Future<PaginatedResponse<CourseItem>> _fetchCourses({
    required int page,
    CourseType? filterByType,
    CourseCategory? filterByTopic,
    CourseSortOption? sortBy,
    String? query,
    CeRequirement? ceRequirement,
  }) {
    return _coursePackage.getCourses(
      page: page,
      pageSize: _itemsPerPage,
      filterByType: filterByType,
      filterByTopic: filterByTopic,
      sortBy: sortBy,
      query: query,
      ceRequirement: ceRequirement,
    );
  }

  FutureOr<void> _onCeRequirementChanged(
    _CeRequirementChanged event,
    Emitter<CourseListState> emit,
  ) async {
    if (event.ceRequirement == state.ceRequirement) {
      return;
    }

    emit(
      state.copyWith(
        ceRequirement: event.ceRequirement,
        currentPage: 1,
        hasReachedMax: false,
      ),
    );
    add(const CourseListEvent.started());
  }
}
