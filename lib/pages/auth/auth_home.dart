import 'package:flutter/material.dart';

class AuthHome extends StatelessWidget {
  AuthHome({this.onTappedLogin});

  final VoidCallback onTappedLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anmelden'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Auth Home',
              style: Theme.of(context).textTheme.headline3,
            ),
            RaisedButton(
              child: Text('Log in'),
              onPressed: onTappedLogin,
            )
          ],
      )),
    );
  }
}
