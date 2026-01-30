import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rxce/ui/auth/view/registeration/registration_screen.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegistrationScreen();
  }
}
