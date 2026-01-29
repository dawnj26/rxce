import 'package:flutter/material.dart';
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
                Text(
                  context.l10n.emailLabel,
                  style: context.appText.labelLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: context.l10n.emailHint,
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                Text(
                  context.l10n.passwordLabel,
                  style: context.appText.labelLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const PasswordField(
                  textInputAction: TextInputAction.done,
                ),
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
                FilledButton(
                  onPressed: () {},
                  child: Text(
                    context.l10n.signInButtonLabel,
                  ),
                ),
                const Spacer(),
                Row(
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
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
