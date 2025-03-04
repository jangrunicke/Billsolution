import 'package:billsolution_app/components/primary_button.dart';
import 'package:billsolution_app/pages/auth/widgets/auth_input_text_field.dart';
import 'package:flutter/material.dart';

import 'auth_popup.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text('Passwort'), Text('zurücksetzen')],
        ),
        leadingWidth: 130,
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
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 100.0),
                AuthInputTextField(
                  hintText: 'E-Mail Adresse',
                  obscureText: false,
                ),
                SizedBox(height: 100.0),
                PrimaryButton(
                  text: 'Zurücksetzen',
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AuthPopup(
                          title: 'Link versendet',
                          text:
                              'Wir haben dir ein Zurücksetzungslink an deine E-Mail Adresse gesendet. Folge den Anweisungen dort, um dein Passwort zurückzusetzen.')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
