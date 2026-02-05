import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:rxce/ui/account/account.dart';
import 'package:rxce/ui/auth/auth.dart';
import 'package:rxce/ui/browse/browse.dart';
import 'package:rxce/ui/cart/cart.dart';
import 'package:rxce/ui/course/course.dart';
import 'package:rxce/ui/dashboard/dashboard.dart';
import 'package:rxce/ui/home/home.dart';
import 'package:rxce/ui/learn/learn.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SignInRoute.page,
      path: '/signin',
    ),
    AutoRoute(page: RegistrationRoute.page, path: '/signup'),
    AutoRoute(
      path: '/courses',
      page: CourseRoute.page,
      children: [
        AutoRoute(page: CourseListRoute.page, initial: true, path: ''),
        AutoRoute(page: CourseSearchRoute.page, path: 'search'),
        AutoRoute(page: CourseSearchResultRoute.page, path: 'search/:query'),
      ],
    ),
    AutoRoute(
      page: DashboardRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
        AutoRoute(page: LearnRoute.page, path: 'learn'),
        AutoRoute(page: BrowseRoute.page, path: 'browse'),
        AutoRoute(page: CartRoute.page, path: 'cart'),
        AutoRoute(page: AccountRoute.page, path: 'account'),
      ],
    ),
  ];
}
