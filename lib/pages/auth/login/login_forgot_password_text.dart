import '../forgot_password/forgot_password_page.dart';
import 'package:flutter/material.dart';

class LoginForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route =
            MaterialPageRoute(builder: (context) => ForgotPasswordPage());
        Navigator.push(context, route);
      },
      child: Text('Passwort vergessen?'),
    );
  }
}
