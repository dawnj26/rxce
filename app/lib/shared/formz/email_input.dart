import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

enum EmailValidationError {
  empty,
  invalid
  ;

  String get message {
    switch (this) {
      case EmailValidationError.empty:
        return 'Email cannot be empty';
      case EmailValidationError.invalid:
        return 'Email is not valid';
    }
  }
}

class EmailInput extends FormzInput<String, EmailValidationError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    }

    if (!EmailValidator.validate(value)) {
      return EmailValidationError.invalid;
    }

    return null;
  }
}
