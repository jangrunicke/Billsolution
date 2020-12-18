import 'package:billsolution_app/app_shell.dart';
import 'package:billsolution_app/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BillSolution',
      theme: AppTheme.themeData,
      home: AppShell(),
    );
  }
}