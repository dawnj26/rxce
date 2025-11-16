import 'package:flutter/material.dart';

class SelectCard extends StatelessWidget {
  const SelectCard({
    required this.child,
    super.key,
    this.onTap,
    this.isSelected = false,
  });

  final VoidCallback? onTap;
  final Widget child;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: isSelected
            ? BorderSide(
                color: colorScheme.primary,
                width: 2,
              )
            : BorderSide.none,
      ),
      elevation: 0,
      color: colorScheme.surfaceBright,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            16,
            12,
            16,
            12,
          ),
          child: child,
        ),
      ),
    );
  }
}
