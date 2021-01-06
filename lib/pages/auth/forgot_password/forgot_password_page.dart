import 'package:billsolution_app/pages/auth/auth_theme.dart';
import 'package:billsolution_app/pages/auth/forgot_password/forgot_password_reset_button.dart';
import 'package:billsolution_app/pages/auth/popup/popup_button.dart';
import 'package:billsolution_app/pages/auth/widgets/auth_input_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passwort zurücksetzen'),
        leadingWidth: 100,
        leading: FlatButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
            size: 20,
          ),
          label: Text(
            'zurück',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Inter',
              color: Colors.white,
            ),
          ),
        ),
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
                  'Bitte gebe die E-Mail Adresse deines Kontos ein. Wir senden einen Link zum zurücksetzen deines Passworts.',
                  style: AuthTheme().style,
                ),
                SizedBox(height: 100.0),
                AuthInputTextField(
                  hintText: 'E-Mail Adresse',
                  obscureText: false,
                ),
                SizedBox(height: 100.0),
                ForgotPasswordResetButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
