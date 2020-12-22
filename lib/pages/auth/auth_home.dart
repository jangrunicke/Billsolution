import 'package:flutter/material.dart';
import 'login/login_button.dart';
import 'login/email_field.dart';
import 'login/password_field.dart';
import 'login/registry_button.dart';

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
                EmailField(),
                SizedBox(height: 25.0),
                PasswordField(),
                SizedBox(height: 35.0),
                LoginButton(onTappedLogin: onTappedLogin),
                SizedBox(height: 25.0),
                RegistryButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
