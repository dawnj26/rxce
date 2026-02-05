import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/sign_up/sign_up_bloc.dart';
import 'package:rxce/ui/auth/view/registeration/registration_screen.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget implements AutoRouteWrapper {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegistrationScreen();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: this,
    );
  }
}
