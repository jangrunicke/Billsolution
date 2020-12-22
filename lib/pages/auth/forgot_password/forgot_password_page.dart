import 'package:billsolution_app/pages/auth/auth_theme.dart';
import 'package:billsolution_app/pages/auth/widgets/auth_button.dart';
import 'package:billsolution_app/pages/auth/widgets/auth_input_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passwort zurücksetzen'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 150.0),
                Text(
                  'Bitte gebe die E-Mail Adresse deines Kontos ein. Wir senden einen Link zu zurücksetzen deines Passworts.',
                  style: AuthTheme().style,
                ),
                SizedBox(height: 100.0),
                AuthInputTextField(
                  hintText: 'E-Mail Adresse',
                  obscureText: false,
                ),
                SizedBox(height: 100.0),
                AuthButton(
                  buttonColor: Color(0xff1d3557),
                  textColor: Colors.white,
                  text: 'Zurücksetzen',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
