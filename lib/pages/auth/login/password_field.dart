import 'package:flutter/material.dart';
import '../auth_theme.dart';

class PasswordField extends StatelessWidget {
  final TextStyle style = AuthTheme().style;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Passwort',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
