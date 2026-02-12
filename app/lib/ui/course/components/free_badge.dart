import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:theme_package/theme_package.dart';

class FreeBadge extends StatelessWidget {
  const FreeBadge({super.key, this.membersOnly = false});

  final bool membersOnly;

  @override
  Widget build(BuildContext context) {
    final color = context.appColor.tertiary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.shade500,
        ),
        color: color.shade50,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            LucideIcons.star,
            size: 10,
            color: color.shade500,
          ),
          const SizedBox(width: 4),
          Text(
            'Free',
            style: context.appText.labelSmall.copyWith(
              color: color.shade500,
              fontVariations: [
                const FontVariation('wght', 600),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
