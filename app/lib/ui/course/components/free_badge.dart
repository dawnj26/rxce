import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FreeBadge extends StatelessWidget {
  const FreeBadge({super.key, this.membersOnly = false});

  final bool membersOnly;

  @override
  Widget build(BuildContext context) {
    final color = membersOnly ? Colors.orange : Colors.green;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color,
          width: 1.5,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            FontAwesomeIcons.circleCheck,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            'FREE',
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
