import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);
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
