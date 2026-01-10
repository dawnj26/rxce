import 'package:flutter/material.dart';
import 'package:rxce/l10n/l10n.dart';
import 'package:rxce/router/router.dart';
import 'package:theme_package/theme_package.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter();

    // You can perform other one-time initialization tasks here.
  }

  @override
  Widget build(BuildContext context) {
    return _AppView(router: _router);
  }
}

class _AppView extends StatelessWidget {
  const _AppView({
    required this.router,
  });

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      title: 'RxCE',
      theme: ThemePackage.light,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
