import 'package:flutter/material.dart';
import '../auth_theme.dart';

class AuthButton extends StatelessWidget {
  final TextStyle style = AuthTheme().style;

  final String text;
  final Color buttonColor;
  final Color textColor;

  AuthButton({this.text, this.buttonColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8),
      color: buttonColor,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: style.copyWith(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
