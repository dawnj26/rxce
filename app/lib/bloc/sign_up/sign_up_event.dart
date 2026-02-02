part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.submitted() = _Submitted;
  const factory SignUpEvent.emailChanged(String email) = _EmailChanged;
  const factory SignUpEvent.passwordChanged(String password) = _PasswordChanged;
  const factory SignUpEvent.confirmPasswordChanged(String confirmPassword) =
      _ConfirmPasswordChanged;
  const factory SignUpEvent.wantsUpdatesChanged({
    required bool wantsUpdates,
  }) = _WantsUpdatesChanged;
  const factory SignUpEvent.acceptedTermsChanged({
    required bool acceptedTerms,
  }) = _AcceptedTermsChanged;
  const factory SignUpEvent.professionChanged(Profession? profession) =
      _ProfessionChanged;
}
