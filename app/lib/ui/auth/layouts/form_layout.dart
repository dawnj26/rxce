import 'package:flutter/material.dart';
import 'package:rxce/shared/components/components.dart';
import 'package:theme_package/theme_package.dart';

class FormLayout extends StatelessWidget {
  const FormLayout({
    required this.subtitle,
    required this.title,
    this.children = const [],
    super.key,
  });

  final String title;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      child: Scaffold(
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
                  title,
                  style: context.appText.heading1.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: context.appText.labelLarge,
                ),
                const SizedBox(height: 32),
                ...children,
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
