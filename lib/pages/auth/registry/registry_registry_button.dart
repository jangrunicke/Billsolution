import 'package:billsolution_app/pages/auth/popup/popup.dart';
import 'package:flutter/material.dart';
import '../auth_theme.dart';
import 'registry_page.dart';
import '../auth_router.dart';

class RegistryRegistryButton extends StatelessWidget {
  final TextStyle style = AuthTheme().style;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8),
      color: Color(0xff1d3557),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AuthPopup(
                    title: 'Account erstellt',
                    text:
                        'Bitte folge dem Link in deiner Email um deinen Account zu aktivieren',
                  ));
        },
        child: Text(
          'Registrieren',
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
