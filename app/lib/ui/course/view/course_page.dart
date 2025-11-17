import 'package:auto_route/auto_route.dart';
import 'package:course_package/course_package.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CoursePage extends AutoRouter implements AutoRouteWrapper {
  const CoursePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CoursePackage(),
      child: this,
    );
  }
}
