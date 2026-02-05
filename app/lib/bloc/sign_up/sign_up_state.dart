part of 'sign_up_bloc.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState.initial({
    @Default(EmailInput.pure()) EmailInput email,
    @Default(PasswordInput.pure()) PasswordInput password,
    @Default(ConfirmPasswordInput.pure()) ConfirmPasswordInput confirmPassword,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(false) bool wantsUpdates,
    @Default(false) bool acceptedTerms,
    Profession? profession,
    String? errorMessage,
  }) = _Initial;
}
