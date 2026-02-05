import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:rxce/router/router.dart';
import 'package:rxce/shared/components/components.dart';
import 'package:rxce/shared/models/models.dart';

@RoutePage()
class DashboardPage extends StatelessWidget implements AutoRouteWrapper {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        BrowseRoute(),
        LearnRoute(),
        CartRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavBarItem(icon: LucideIcons.house, label: 'Home'),
            BottomNavBarItem(icon: LucideIcons.search, label: 'Browse'),
            BottomNavBarItem(icon: LucideIcons.bookOpenText, label: 'Learn'),
            BottomNavBarItem(icon: LucideIcons.shoppingCart, label: 'Cart'),
            BottomNavBarItem(icon: LucideIcons.user, label: 'Account'),
          ],
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}
