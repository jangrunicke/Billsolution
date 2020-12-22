import 'package:billsolution_app/pages/auth/widgets/auth_input_text_field.dart';

import 'login/login_button.dart';
import 'login/login_registry_button.dart';
import 'login/login_forgot_password_text.dart';

import 'package:flutter/material.dart';

class AuthHome extends StatelessWidget {
  AuthHome({this.onTappedLogin});

  final VoidCallback onTappedLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anmelden'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 200.00,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 55.0),
                AuthInputTextField(
                  hintText: 'E-Mail Adresse',
                  obscureText: false,
                ),
                SizedBox(height: 25.0),
                AuthInputTextField(
                  hintText: 'Passwort',
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                LoginForgotPasswordText(),
                SizedBox(height: 35.0),
                LoginButton(onTappedLogin: onTappedLogin),
                SizedBox(height: 25.0),
                LoginRegistryButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
