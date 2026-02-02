import 'package:formz/formz.dart';

enum ConfirmPasswordValidationError {
  empty,
  notMatch
  ;

  String get message {
    switch (this) {
      case ConfirmPasswordValidationError.empty:
        return 'Confirm Password cannot be empty';
      case ConfirmPasswordValidationError.notMatch:
        return 'Passwords do not match';
    }
  }
}

class ConfirmPasswordInput
    extends FormzInput<String, ConfirmPasswordValidationError> {
  const ConfirmPasswordInput.pure({this.password = ''}) : super.pure('');
  const ConfirmPasswordInput.dirty({required this.password, String value = ''})
    : super.dirty(value);

  final String password;

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return ConfirmPasswordValidationError.empty;
    }

    if (value != password) {
      return ConfirmPasswordValidationError.notMatch;
    }

    return null;
  }
}
