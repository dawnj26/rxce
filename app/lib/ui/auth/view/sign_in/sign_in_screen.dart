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
                  'Email address',
                  style: context.appText.labelLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'example@email.com',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Password',
                  style: context.appText.labelLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const PasswordField(),
                const SizedBox(height: 32),
                FilledButton(
                  onPressed: () {},
                  child: const Text('Authenticate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
