import 'package:flutter/material.dart';

class ScanHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scannen'),
      ),
      body: Container(
        child: Center(
          child: (
            Text('Scannen Home')
          ),
        )
      ),
    );
  }
}