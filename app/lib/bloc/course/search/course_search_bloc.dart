import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxce/shared/constants/constants.dart';

part 'course_search_bloc.freezed.dart';
part 'course_search_event.dart';
part 'course_search_state.dart';

class CourseSearchBloc extends Bloc<CourseSearchEvent, CourseSearchState> {
  CourseSearchBloc() : super(const _Initial()) {
    on<_QueryChanged>(
      _onQueryChanged,
    );
  }

  FutureOr<void> _onQueryChanged(
    _QueryChanged event,
    Emitter<CourseSearchState> emit,
  ) async {
    emit(
      state.copyWith(
        status: LoadingStatus.success,
        query: event.query,
      ),
    );
  }
}
