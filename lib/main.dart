import 'package:billsolution_app/app_shell.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BillSolution',
      home: AppShell(),
    );
  }
}