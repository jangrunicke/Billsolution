import 'package:flutter/material.dart';

class SettingsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Einstellungen'),
      ),
      body: Container(
        child: Center(
          child: (
            Text('Settings Home')
          ),
        )
      ),
    );
  }
}