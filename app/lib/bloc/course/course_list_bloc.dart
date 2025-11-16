import 'dart:async';

import 'package:app/shared/loading_status.dart';
import 'package:app/shared/stream.dart';
import 'package:bloc/bloc.dart';
import 'package:course_package/course_package.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_list_event.dart';
part 'course_list_state.dart';
part 'course_list_bloc.freezed.dart';

class CourseListBloc extends Bloc<CourseListEvent, CourseListState> {
  CourseListBloc({
    required CoursePackage coursePackage,
  }) : _coursePackage = coursePackage,
       super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_LoadMore>(
      _onLoadMore,
      transformer: throttleDroppable(
        const Duration(milliseconds: 300),
      ),
    );
    on<_SortChanged>(_onSortChanged);
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
      final response = await _coursePackage.getCourses(
        sortBy: state.sortOptions,
        filterByType: state.filterByType,
        filterByTopic: state.filterByTopic,
        pageSize: _itemsPerPage,
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
      final response = await _coursePackage.getCourses(
        page: nextPage,
        sortBy: state.sortOptions,
        filterByType: state.filterByType,
        filterByTopic: state.filterByTopic,
        pageSize: _itemsPerPage,
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

  FutureOr<void> _onSortChanged(
    _SortChanged event,
    Emitter<CourseListState> emit,
  ) {
    emit(
      state.copyWith(
        sortOptions: event.sortOptions,
        currentPage: 1,
        hasReachedMax: false,
        courses: [],
      ),
    );
    add(const CourseListEvent.started());
  }

  FutureOr<void> _onFilterChanged(
    _FilterChanged event,
    Emitter<CourseListState> emit,
  ) {
    emit(
      state.copyWith(
        filterByTopic: event.filterByTopic,
        filterByType: event.filterByType,
        currentPage: 1,
        hasReachedMax: false,
        courses: [],
      ),
    );
    add(const CourseListEvent.started());
  }
}
