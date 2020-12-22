import 'package:billsolution_app/pages/auth/auth_theme.dart';

import 'registry_button.dart';
import 'registry_email_field.dart';
import 'registry_password_field.dart';
import 'registry_repeat_password_field.dart';
import 'package:flutter/material.dart';

class RegistryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrieren'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 80.0),
                Text(
                  'Zum Registrieren bitte E-Mail Adresse und Passwort vergeben. Wir senden Ihnen eine E-Mail, damit Sie ihren Account Bstätigen Können ',
                  style: AuthTheme().style,
                ),
                SizedBox(height: 80.0),
                RegistryEmailField(),
                SizedBox(height: 30.0),
                RegistryPasswordField(),
                SizedBox(height: 30.0),
                RegistryRepeatPasswordField(),
                SizedBox(height: 55.0),
                RegistryButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
