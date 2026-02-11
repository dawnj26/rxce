import 'package:flutter/material.dart';
import 'package:theme_package/theme_package.dart';

class CeuBadge extends StatelessWidget {
  const CeuBadge({
    required this.ceus,
    super.key,
  });

  final double ceus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: context.appColor.primary.shade500,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$ceus CEU',
        style: context.appText.labelMedium.copyWith(
          color: context.appColor.primary.shade50,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
