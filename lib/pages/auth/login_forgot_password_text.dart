import 'forgot_password_page.dart';
import 'package:flutter/material.dart';

class LoginForgotPasswordText extends StatelessWidget {
  LoginForgotPasswordText({this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        'Passwort vergessen?',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}
