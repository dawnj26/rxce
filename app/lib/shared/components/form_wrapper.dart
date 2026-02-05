import 'package:flutter/material.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: child,
      ),
    );
  }
}
