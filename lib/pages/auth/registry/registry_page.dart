import 'package:billsolution_app/pages/auth/registry/registry_registry_button.dart';

import '../widgets/auth_input_text_field.dart';
import '../auth_theme.dart';
import '../popup/popup_button.dart';

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
                  'Zum Registrieren bitte E-Mail Adresse und Passwort vergeben. Wir senden Ihnen eine E-Mail, damit Sie ihren Account Bestätigen Können ',
                  style: AuthTheme().style,
                ),
                SizedBox(height: 80.0),
                AuthInputTextField(
                  hintText: 'E-Mail Adresse',
                  obscureText: false,
                ),
                SizedBox(height: 30.0),
                AuthInputTextField(
                  hintText: 'Passwort',
                  obscureText: true,
                ),
                SizedBox(height: 30.0),
                AuthInputTextField(
                  hintText: 'Passwort wiederholen',
                  obscureText: true,
                ),
                SizedBox(height: 55.0),
                RegistryRegistryButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
