import 'package:app/ui/course/course.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: CourseRoute.page,
      initial: true,
      children: [
        AutoRoute(page: CourseListRoute.page, initial: true),
        AutoRoute(page: CourseSearchRoute.page),
        AutoRoute(page: CourseSearchResultRoute.page),
      ],
    ),
  ];
}
