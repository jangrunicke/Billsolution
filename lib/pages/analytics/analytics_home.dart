import 'package:flutter/material.dart';

class AnalyticsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auswertung'),
      ),
      body: Container(
        child: Center(
          child: (
            Text('Analytics Home')
          ),
        )
      ),
    );
  }
}