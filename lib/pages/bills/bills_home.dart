import 'package:flutter/material.dart';

class BillsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belege'),
      ),
      body: Container(
        child: Center(
          child: (
            Text('Belege Home')
          ),
        )
      ),
    );
  }
}