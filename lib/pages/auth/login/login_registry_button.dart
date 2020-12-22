import 'dart:html';

import 'package:flutter/material.dart';
import '../auth_theme.dart';
import '../registry/registry_page.dart';
import '../auth_router.dart';

class LoginRegistryButton extends StatelessWidget {
  final TextStyle style = AuthTheme().style;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8),
      color: Color(0xffe0e0e0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => RegistryPage());
          Navigator.push(context, route);
        },
        child: Text(
          'Registrieren',
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Color(0xff414141), fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
