import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:rxce/l10n/l10n.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onChanged, this.textInputAction});

  final void Function(String value)? onChanged;
  final TextInputAction? textInputAction;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: context.l10n.passwordHint,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          icon: Icon(
            _obscureText ? LucideIcons.eyeClosed : LucideIcons.eye,
          ),
        ),
      ),
      textInputAction: widget.textInputAction,
    );
  }
}
