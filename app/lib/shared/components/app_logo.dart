import 'package:flutter/material.dart';

enum AppLogoType {
  full,
  icon,
}

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.type = AppLogoType.full,
    this.size = 48,
    this.alignment = Alignment.centerLeft,
    this.padding = EdgeInsets.zero,
  });

  final AppLogoType type;
  final double size;
  final Alignment alignment;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Image.asset(
        type == AppLogoType.full
            ? 'assets/images/logo_full.png'
            : 'assets/images/logo_icon.png',
        width: size,
        height: size,
        alignment: alignment,
      ),
    );
  }
}
