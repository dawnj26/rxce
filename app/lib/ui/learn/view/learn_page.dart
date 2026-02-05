import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rxce/ui/learn/view/learn_screen.dart';

@RoutePage()
class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LearnScreen();
  }
}
