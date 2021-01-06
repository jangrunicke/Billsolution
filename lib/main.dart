import 'package:billsolution_app/app_shell.dart';
import 'package:billsolution_app/pages/auth/auth_home.dart';
import 'package:billsolution_app/theme.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // TODO: Quickfix solution, statemanagement needed
  bool _initalized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initalized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  Widget buildScreen() {
    return Consumer<UserModel>(
      builder: (context, user, child) {
        if (user.isLoggedIn) {
          return AppShell();
        }
        return AuthHome();
      }
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
