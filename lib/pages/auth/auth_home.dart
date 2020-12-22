import 'package:flutter/material.dart';
import 'login_button.dart';
import 'email_field.dart';
import 'password_field.dart';
import 'registry_button.dart';

class AuthHome extends StatelessWidget {
  AuthHome({this.onTappedLogin});

  final VoidCallback onTappedLogin;

  final TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8),
      color: Color(0xff1d3557),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: onTappedLogin,
        child: Text(
          'Anmelden',
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

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
                // TODO: onTappedLogin in login_butto funktioniert noch nicht
                loginButton,
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
