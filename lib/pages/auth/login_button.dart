import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({this.onTappedLogin});

  final VoidCallback onTappedLogin;

  final TextStyle style = TextStyle(fontFamily: 'Roboto', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Material(
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
  }
}
