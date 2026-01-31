import 'package:flutter/material.dart';
import 'package:rxce/ui/auth/layouts/layouts.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FormLayout(
      subtitle: 'Enter your details to create an account',
      title: 'Sign up',
    );
  }
}
