import 'package:billsolution_app/pages/auth/auth_home.dart';
import 'package:billsolution_app/pages/auth/popup/popup.dart';
import 'package:flutter/material.dart';
import '../auth_theme.dart';

class PopupButton extends StatelessWidget {
  final TextStyle style = AuthTheme().style;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(8),
      color: Color(0xff1d3557),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(25, 15.0, 25, 15.0),
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        },
        child: Text(
          'Ok',
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
