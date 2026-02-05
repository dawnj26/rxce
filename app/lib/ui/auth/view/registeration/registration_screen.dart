import 'package:authentication_package/authentication_package.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rxce/bloc/sign_up/sign_up_bloc.dart';
import 'package:rxce/l10n/l10n.dart';
import 'package:rxce/shared/components/label.dart';
import 'package:rxce/shared/components/password_field.dart';
import 'package:rxce/ui/auth/layouts/layouts.dart';
import 'package:theme_package/theme_package.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormLayout(
      subtitle: 'Enter your details to create an account',
      title: 'Sign up',
      children: [
        Label(
          context.l10n.emailLabel,
          important: true,
        ),
        const SizedBox(height: 8),
        const _Email(),
        const SizedBox(height: 16),
        Label(
          context.l10n.passwordLabel,
          important: true,
        ),
        const SizedBox(height: 8),
        const _Password(),
        const SizedBox(height: 16),
        const Label(
          'Confirm Password',
          important: true,
        ),
        const SizedBox(height: 8),
        const _ConfirmPassword(),
        const SizedBox(
          height: 16,
        ),
        const Label('Profession'),
        const SizedBox(height: 8),
        const _Profession(),
        const SizedBox(height: 16),
        const _WantUpdates(),
        const _AgreeTerms(),
        const SizedBox(height: 16),
        const _CreateAccount(),
        const _Footer(),
      ],
    );
  }
}

final List<DropdownMenuItem<Profession>> professionOptions = [
  ...Profession.values.map(
    (e) => DropdownMenuItem(value: e, child: Text(e.label)),
  ),
  const DropdownMenuItem<Profession>(child: Text('None')),
];

class _Profession extends StatelessWidget {
  const _Profession();

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (SignUpBloc bloc) => bloc.state.status,
    );

    return DropdownButtonFormField<Profession>(
      items: professionOptions,
      onChanged: status == FormzSubmissionStatus.inProgress
          ? null
          : (value) => onChanged(context, value),
      hint: const Text('Select your profession'),
    );
  }

  void onChanged(BuildContext context, Profession? value) {
    context.read<SignUpBloc>().add(
      SignUpEvent.professionChanged(value),
    );
  }
}

class _CreateAccount extends StatelessWidget {
  const _CreateAccount();

  @override
  Widget build(BuildContext context) {
    final acceptedTerms = context.select(
      (SignUpBloc bloc) => bloc.state.acceptedTerms,
    );
    final status = context.select(
      (SignUpBloc bloc) => bloc.state.status,
    );

    return FilledButton(
      onPressed: acceptedTerms && status != FormzSubmissionStatus.inProgress
          ? () {}
          : null,
      child: const Text('Create account'),
    );
  }
}

class _AgreeTerms extends StatelessWidget {
  const _AgreeTerms();

  @override
  Widget build(BuildContext context) {
    final acceptedTerms = context.select(
      (SignUpBloc bloc) => bloc.state.acceptedTerms,
    );
    final status = context.select(
      (SignUpBloc bloc) => bloc.state.status,
    );

    return _Checkbox(
      enabled: status != FormzSubmissionStatus.inProgress,
      value: acceptedTerms,
      title: 'I agree to the Terms of Service',
      onChanged: (value) {
        context.read<SignUpBloc>().add(
          SignUpEvent.acceptedTermsChanged(acceptedTerms: value ?? false),
        );
      },
    );
  }
}

class _WantUpdates extends StatelessWidget {
  const _WantUpdates();

  @override
  Widget build(BuildContext context) {
    final wantsUpdates = context.select(
      (SignUpBloc bloc) => bloc.state.wantsUpdates,
    );
    final status = context.select(
      (SignUpBloc bloc) => bloc.state.status,
    );

    return _Checkbox(
      enabled: status != FormzSubmissionStatus.inProgress,
      value: wantsUpdates,
      title: 'I want RxCe.com to send me course updates and sale mailers!',
      onChanged: (value) {
        context.read<SignUpBloc>().add(
          SignUpEvent.wantsUpdatesChanged(wantsUpdates: value ?? false),
        );
      },
    );
  }
}

class _ConfirmPassword extends StatelessWidget {
  const _ConfirmPassword();

  @override
  Widget build(BuildContext context) {
    final confirmPassword = context.select(
      (SignUpBloc bloc) => bloc.state.confirmPassword,
    );
    final status = context.select(
      (SignUpBloc bloc) => bloc.state.status,
    );

    return PasswordField(
      enabled: status != FormzSubmissionStatus.inProgress,
      errorText: confirmPassword.displayError?.message,
      labelText: 'Re-enter your password',
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      onChanged: (value) {
        context.read<SignUpBloc>().add(
          SignUpEvent.confirmPasswordChanged(value),
        );
      },
    );
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    final password = context.select((SignUpBloc bloc) => bloc.state.password);
    final status = context.select(
      (SignUpBloc bloc) => bloc.state.status,
    );

    return PasswordField(
      enabled: status != FormzSubmissionStatus.inProgress,
      labelText: context.l10n.passwordHint,
      textInputAction: TextInputAction.next,
      onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      onChanged: (value) {
        context.read<SignUpBloc>().add(SignUpEvent.passwordChanged(value));
      },
      errorText: password.displayError?.message,
    );
  }
}

class _Email extends StatelessWidget {
  const _Email();

  @override
  Widget build(BuildContext context) {
    final email = context.select((SignUpBloc bloc) => bloc.state.email);
    final status = context.select(
      (SignUpBloc bloc) => bloc.state.status,
    );

    return TextFormField(
      enabled: status != FormzSubmissionStatus.inProgress,
      decoration: InputDecoration(
        hintText: context.l10n.emailHint,
        errorText: email.displayError?.message,
      ),
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
      onChanged: (value) {
        context.read<SignUpBloc>().add(SignUpEvent.emailChanged(value));
      },
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (SignUpBloc bloc) => bloc.state.status,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            'Already have an account?',
            style: context.appText.labelSmall,
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: context.appText.labelSmall.copyWith(
              fontWeight: FontWeight.w700,
            ),
            padding: const .symmetric(horizontal: 16, vertical: 8),
            minimumSize: Size.zero,
          ),
          onPressed: status != FormzSubmissionStatus.inProgress
              ? () => _onSignInPressed(context)
              : null,
          child: const Text('Sign In'),
        ),
      ],
    );
  }

  Future<void> _onSignInPressed(BuildContext context) async {
    await context.router.replacePath('/signin');
  }
}

class _Checkbox extends StatelessWidget {
  const _Checkbox({
    required this.title,
    this.onChanged,
    this.value,
    this.enabled,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final String title;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      enabled: enabled,
      contentPadding: EdgeInsets.zero,
      value: value,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: onChanged,
      title: Text(
        title,
        style: context.appText.labelSmall,
      ),
    );
  }
}
