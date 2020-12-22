import 'package:billsolution_app/app_shell.dart';
import 'package:billsolution_app/pages/auth/auth_home.dart';
import 'package:billsolution_app/pages/bills/bills_home.dart';
import 'package:billsolution_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // TODO: Quickfix solution, statemanagement needed
  bool _isLoggedIn = false;

  void onTappedLogin() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  Widget buildScreen() {
    if (_isLoggedIn) {
      return AppShell();
    }
    return AuthHome(
      onTappedLogin: onTappedLogin,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BillSolution',
      theme: AppTheme.themeData,
      home: buildScreen(),
    );
  }
}
