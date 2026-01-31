import 'package:flutter/material.dart';
import 'package:theme_package/theme_package.dart';

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.important = false});

  final String text;
  final bool important;

  @override
  Widget build(BuildContext context) {
    final labelStyle = context.appText.labelMedium.copyWith(
      fontWeight: FontWeight.w600,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: labelStyle,
        ),
        if (important)
          Text(
            ' *',
            style: labelStyle.copyWith(
              color: context.appColor.danger.shade500,
            ),
          ),
      ],
    );
  }
}
