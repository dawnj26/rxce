import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    required this.activeFiltersCount,
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final int activeFiltersCount;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Row(
        children: [
          const Text('Filter'),
          if (activeFiltersCount > 0) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$activeFiltersCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ],
      ),
      icon: const Icon(Icons.filter_list),
    );
  }
}
