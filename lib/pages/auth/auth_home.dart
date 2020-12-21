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
          TextFormField(
            decoration:
                InputDecoration(labelText: 'Gebe deine E-Mail Adresse ein'),
          ),
          Text(
            'Auth Home',
            style: Theme.of(context).textTheme.headline3,
          ),
          RaisedButton(
            child: Text('Anmelden'),
            onPressed: onTappedLogin,
          )
        ],
      )),
    );
  }
}
