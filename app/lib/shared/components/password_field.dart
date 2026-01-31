import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onChanged,
    this.textInputAction,
    this.errorText,
    this.enabled,
    this.labelText,
  });

  final void Function(String value)? onChanged;
  final TextInputAction? textInputAction;
  final String? errorText;
  final bool? enabled;
  final String? labelText;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      obscureText: _obscureText,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        errorText: widget.errorText,
        labelText: widget.labelText,
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
