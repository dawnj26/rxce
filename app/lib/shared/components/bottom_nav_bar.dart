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

    return Container(
      padding: .fromLTRB(0, 0, 0, bottomPad),
      color: context.appColor.neutral.shade50,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
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
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
