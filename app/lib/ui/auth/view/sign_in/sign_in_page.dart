import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/sign_in/sign_in_bloc.dart';
import 'package:rxce/ui/auth/view/sign_in/sign_in_screen.dart';

@RoutePage()
class SignInPage extends StatelessWidget implements AutoRouteWrapper {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SignInScreen();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: this,
    );
  }
}
