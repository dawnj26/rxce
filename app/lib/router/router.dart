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
      path: '/courses',
      page: CourseRoute.page,
      initial: true,
      children: [
        AutoRoute(page: CourseListRoute.page, initial: true, path: ''),
        AutoRoute(page: CourseSearchRoute.page, path: 'search'),
        AutoRoute(page: CourseSearchResultRoute.page, path: 'search/:query'),
      ],
    ),
  ];
}
