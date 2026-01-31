import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:rxce/bloc/sign_in/sign_in_bloc.dart';
import 'package:rxce/l10n/l10n.dart';
import 'package:rxce/shared/components/components.dart';
import 'package:theme_package/theme_package.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ThemePackage.padding),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                const AppLogo(
                  type: AppLogoType.icon,
                  size: 40,
                  padding: .fromLTRB(0, 8, 0, 16),
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.loginTitle,
                  style: context.appText.heading1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  context.l10n.loginSubtitle,
                  style: context.appText.labelLarge,
                ),
                const SizedBox(height: 32),
                Label(
                  context.l10n.emailLabel,
                ),
                const SizedBox(height: 8),
                const _Email(),
                const SizedBox(height: 16),
                Label(
                  context.l10n.passwordLabel,
                ),
                const SizedBox(height: 8),
                const _Password(),
                Row(
                  mainAxisAlignment: .end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(context.l10n.forgotPasswordLabel),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const _SubmitButton(),
                const Spacer(),
                const _Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            "Don't have an account?",
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
          onPressed: () => _onSignUpPressed(context),
          child: const Text('Sign Up'),
        ),
      ],
    );
  }

  Future<void> _onSignUpPressed(BuildContext context) async {
    await context.router.replacePath('/signup');
  }
}

class _Email extends StatelessWidget {
  const _Email();

  @override
  Widget build(BuildContext context) {
    final email = context.select(
      (SignInBloc bloc) => bloc.state.email,
    );
    final status = context.select(
      (SignInBloc bloc) => bloc.state.status,
    );

    return TextFormField(
      enabled: status != FormzSubmissionStatus.inProgress,
      decoration: InputDecoration(
        errorText: email.displayError?.message,
        labelText: context.l10n.emailHint,
      ),
      textInputAction: TextInputAction.next,
      onChanged: (value) {
        context.read<SignInBloc>().add(
          SignInEvent.emailChanged(value),
        );
      },
    );
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    final password = context.select(
      (SignInBloc bloc) => bloc.state.password,
    );
    final status = context.select(
      (SignInBloc bloc) => bloc.state.status,
    );

    return PasswordField(
      enabled: status != FormzSubmissionStatus.inProgress,
      errorText: password.displayError?.message,
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        context.read<SignInBloc>().add(
          SignInEvent.passwordChanged(value),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (SignInBloc bloc) => bloc.state.status,
    );

    if (status == FormzSubmissionStatus.inProgress) {
      return FilledButton(
        onPressed: null,
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Text(
              context.l10n.signInButtonLabel,
            ),
            const SizedBox(
              width: 8,
            ),
            const Spinner(),
          ],
        ),
      );
    }

    return FilledButton(
      onPressed: () {},
      child: Text(
        context.l10n.signInButtonLabel,
      ),
    );
  }
}
