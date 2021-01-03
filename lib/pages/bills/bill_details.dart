import 'package:flutter/material.dart';

class BillDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text('Rewe Einkauf'), Text('27.12.2020')],
        ),
      ),
      body: Container(
        child: Center(child: Text('Beleg Details')),
      ),
    );
  }
}
