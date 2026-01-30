import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxce/shared/formz/email_input.dart';
import 'package:rxce/shared/formz/password_input.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const _Initial()) {
    on<_EmailChanged>(_onEmailChanged);
    on<_PasswordChanged>(_onPasswordChanged);
  }

  FutureOr<void> _onEmailChanged(
    _EmailChanged event,
    Emitter<SignInState> emit,
  ) {
    final email = EmailInput.dirty(event.email);

    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  FutureOr<void> _onPasswordChanged(
    _PasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    final password = PasswordInput.dirty(event.password);

    emit(
      state.copyWith(
        password: password,
      ),
    );
  }
}
