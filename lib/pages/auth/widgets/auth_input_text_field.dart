import 'package:flutter/material.dart';
import '../auth_theme.dart';

class AuthInputTextField extends StatelessWidget {
  final TextStyle style = AuthTheme().style;
  final String hintText;
  final bool obscureText;

  AuthInputTextField({this.hintText, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
