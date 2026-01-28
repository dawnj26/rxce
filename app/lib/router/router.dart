import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:rxce/ui/auth/auth.dart';
import 'package:rxce/ui/course/course.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SignInRoute.page, path: '/signin', initial: true),
    AutoRoute(page: RegistrationRoute.page, path: '/signup'),
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
