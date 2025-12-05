import 'package:auto_route/auto_route.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxce/bloc/course/course_list_bloc.dart';
import 'package:rxce/ui/course/view/list/course_list_screen.dart';

@RoutePage()
class CourseListPage extends StatelessWidget implements AutoRouteWrapper {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CourseListScreen();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CoursePackage(),
      child: BlocProvider(
        create: (context) => CourseListBloc(
          coursePackage: context.read<CoursePackage>(),
        )..add(const CourseListEvent.started()),
        child: this,
      ),
    );
  }
}
