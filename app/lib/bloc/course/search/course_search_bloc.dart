import 'dart:async';

import 'package:app/shared/loading_status.dart';
import 'package:app/shared/stream.dart';
import 'package:bloc/bloc.dart';
import 'package:course_package/course_package.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_search_event.dart';
part 'course_search_state.dart';
part 'course_search_bloc.freezed.dart';

class CourseSearchBloc extends Bloc<CourseSearchEvent, CourseSearchState> {
  CourseSearchBloc({required CoursePackage coursePackage})
    : _coursePackage = coursePackage,
      super(const _Initial()) {
    on<_QueryChanged>(
      _onQueryChanged,
      transformer: debounce(
        const Duration(milliseconds: 300),
      ),
    );
  }

  final int _suggestionLimit = 5;
  final CoursePackage _coursePackage;

  FutureOr<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<CourseSearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LoadingStatus.loading,
        query: event.query,
      ),
    );

    try {
      final suggestions = await _coursePackage.getSearchSuggestions(
        event.query,
        limit: _suggestionLimit,
      );

      emit(
        state.copyWith(
          status: LoadingStatus.success,
          suggestions: suggestions,
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
}
