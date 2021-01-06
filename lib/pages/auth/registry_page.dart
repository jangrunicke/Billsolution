import 'package:billsolution_app/components/primary_button.dart';

import 'auth_popup.dart';
import 'widgets/auth_input_text_field.dart';

import 'package:flutter/material.dart';

class RegistryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrieren'),
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
                SizedBox(height: 80.0),
                Text(
                  'Zum Registrieren bitte E-Mail Adresse und Passwort vergeben. Wir senden Ihnen eine E-Mail, damit Sie ihren Account Bestätigen Können ',
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
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
                PrimaryButton(
                  text: 'Registrieren',
                  onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AuthPopup(
                            title: 'Account erstellt',
                            text:
                                'Bitte folge dem Link in deiner Email um deinen Account zu aktivieren',
                          )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
