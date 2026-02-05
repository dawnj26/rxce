import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rxce/ui/browse/view/browse_screen.dart';

@RoutePage()
class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BrowseScreen();
  }
}
