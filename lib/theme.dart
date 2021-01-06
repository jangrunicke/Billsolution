import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    primaryColor: Color.fromRGBO(29, 53, 87, 1),
    accentColor: Color(0xffe0e0e0),
    textTheme: TextTheme(
      button: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20.00,
          fontWeight: FontWeight.bold,
          color: Colors.white),
      bodyText2: TextStyle(
          fontFamily: 'Roboto', fontSize: 20.0, color: Color(0xff414141)),
    ),
  );
}
