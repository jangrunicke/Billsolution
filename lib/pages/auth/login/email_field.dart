import 'package:flutter/material.dart';
import '../auth_theme.dart';

class EmailField extends StatelessWidget {
  final TextStyle style = AuthTheme().style;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'E-Mail Adresse',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
