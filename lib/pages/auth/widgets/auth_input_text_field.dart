import 'package:flutter/material.dart';

/*
  Ein TextInput Feld mit anpassbarem Hinweistext und der Möglichkeit zum Verdecken
  der Eingabe (bool obscureText)
 */
class AuthInputTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;

  AuthInputTextField({this.hintText, this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}
