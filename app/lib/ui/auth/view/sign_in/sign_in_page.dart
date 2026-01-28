import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rxce/ui/auth/view/sign_in/sign_in_screen.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInScreen();
  }
}
