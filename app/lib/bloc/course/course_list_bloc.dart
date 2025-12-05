import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:course_package/course_package.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxce/shared/loading_status.dart';
import 'package:rxce/shared/stream.dart';
import 'package:rxce/ui/course/models/sort_option.dart';

part 'course_list_bloc.freezed.dart';
part 'course_list_event.dart';
part 'course_list_state.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  CourseListBloc({
    required CoursePackage coursePackage,
    String? query,
  }) : _coursePackage = coursePackage,
       super(
         _Initial(
           query: query,
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
  }

  final CoursePackage _coursePackage;
  final int _itemsPerPage = 10;

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
        sortBy: state.sortOption.options,
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
        sortBy: state.sortOption.options,
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
        sortOption: event.sortOption ?? state.sortOption,
        currentPage: 1,
        hasReachedMax: false,
        courses: [],
      ),
    );
    add(const CourseListEvent.started());
  }

  Future<PaginatedResponse<CourseItem>> _fetchCourses({
    required int page,
    CourseType? filterByType,
    CourseCategory? filterByTopic,
    List<CourseSortOption>? sortBy,
  }) {
    if (state.query != null && state.query!.isNotEmpty) {
      return _coursePackage.searchCourses(
        state.query!,
        page: page,
        pageSize: _itemsPerPage,
        filterByType: filterByType,
        filterByTopic: filterByTopic,
        sortBy: sortBy,
      );
    } else {
      return _coursePackage.getCourses(
        page: page,
        pageSize: _itemsPerPage,
        filterByType: filterByType,
        filterByTopic: filterByTopic,
        sortBy: sortBy,
      );
    }
  }
}
