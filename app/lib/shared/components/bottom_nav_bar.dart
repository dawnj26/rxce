import 'package:flutter/material.dart';
import 'package:rxce/shared/models/models.dart';
import 'package:theme_package/theme_package.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.items,
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  final List<BottomNavBarItem> items;
  final int currentIndex;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    final bottomPad = MediaQuery.viewPaddingOf(context).bottom;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: 64 + bottomPad,
          ),
          padding: EdgeInsets.fromLTRB(0, 0, 0, bottomPad),
          color: context.appColor.neutral.shade50,
          child: SizedBox(
            height: _toDivisibleBy4(
              constraints.maxWidth / items.length,
            ).toDouble(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(items.length, (i) {
                final selected = i == currentIndex;

                return _NavItem(
                  onTap: () => onTap?.call(i),
                  item: items[i],
                  selected: selected,
                );
              }),
            ),
          ),
        );
      },
    );
  }

  int _toDivisibleBy4(double value) {
    return (value / 4).floor() * 4;
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.onTap,
    required this.item,
    required this.selected,
  });

  final void Function()? onTap;
  final BottomNavBarItem item;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item.icon,
              color: selected
                  ? context.appColor.primary.shade500
                  : context.appColor.neutral.shade500,
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: context.appText.labelSmall.copyWith(
                color: selected
                    ? context.appColor.primary.shade500
                    : context.appColor.neutral.shade500,
                fontVariations: [
                  if (selected)
                    const FontVariation('wght', 600)
                  else
                    const FontVariation('wght', 500),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
