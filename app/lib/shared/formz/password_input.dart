import 'package:formz/formz.dart';

enum PasswordValidationError {
  empty,
  tooShort
  ;

  String get message {
    switch (this) {
      case PasswordValidationError.empty:
        return 'Password cannot be empty';
      case PasswordValidationError.tooShort:
        return 'Password must be at least 8 characters long';
    }
  }
}

class PasswordInput extends FormzInput<String, PasswordValidationError> {
  const PasswordInput.pure() : super.pure('');
  const PasswordInput.dirty([super.value = '']) : super.dirty();

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }

    if (value.length < 8) {
      return PasswordValidationError.tooShort;
    }

    return null;
  }
}
