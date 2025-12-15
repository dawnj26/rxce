import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:course_package/course_package.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ce_event.dart';
part 'ce_state.dart';
part 'ce_bloc.freezed.dart';

class CeBloc extends Bloc<CeEvent, CeState> {
  CeBloc() : super(const _Initial()) {
    on<_Changed>(_onChanged);
  }

  FutureOr<void> _onChanged(_Changed event, Emitter<CeState> emit) async {
    emit(
      state.copyWith(
        ceRequirement: event.ceRequirement,
      ),
    );
  }
}
