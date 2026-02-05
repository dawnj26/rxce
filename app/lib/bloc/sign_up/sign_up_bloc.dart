import 'dart:async';

import 'package:authentication_package/authentication_package.dart';
import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxce/shared/formz/confirm_password_input.dart';
import 'package:rxce/shared/formz/email_input.dart';
import 'package:rxce/shared/formz/password_input.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const _Initial()) {
    on<_EmailChanged>(_onEmailChanged);
    on<_PasswordChanged>(_onPasswordChanged);
    on<_ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<_WantsUpdatesChanged>(_onWantsUpdatesChanged);
    on<_AcceptedTermsChanged>(_onAcceptedTermsChanged);
    on<_ProfessionChanged>(_onProfessionChanged);
    on<_Submitted>(_onSubmitted);
  }

  FutureOr<void> _onEmailChanged(
    _EmailChanged event,
    Emitter<SignUpState> emit,
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
    Emitter<SignUpState> emit,
  ) {
    final password = PasswordInput.dirty(event.password);

    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  FutureOr<void> _onConfirmPasswordChanged(
    _ConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final confirmPassword = ConfirmPasswordInput.dirty(
      password: state.password.value,
      value: event.confirmPassword,
    );

    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
      ),
    );
  }

  FutureOr<void> _onWantsUpdatesChanged(
    _WantsUpdatesChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copyWith(
        wantsUpdates: event.wantsUpdates,
      ),
    );
  }

  FutureOr<void> _onAcceptedTermsChanged(
    _AcceptedTermsChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copyWith(
        acceptedTerms: event.acceptedTerms,
      ),
    );
  }

  FutureOr<void> _onProfessionChanged(
    _ProfessionChanged event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copyWith(
        profession: event.profession,
      ),
    );
  }

  FutureOr<void> _onSubmitted(_Submitted event, Emitter<SignUpState> emit) {}
}
