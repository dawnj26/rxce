import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/course/search/course_search_bloc.dart';
import 'package:rxce/ui/course/view/search/course_search_screen.dart';

@RoutePage()
class CourseSearchPage extends StatelessWidget implements AutoRouteWrapper {
  const CourseSearchPage({super.key, this.onFinished});

  final void Function(String query)? onFinished;

  @override
  Widget build(BuildContext context) {
    return CourseSearchScreen(onFinished: onFinished);
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => CourseSearchBloc(),
      child: this,
    );
  }
}
