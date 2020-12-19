import 'package:flutter/material.dart';

class VendorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Rewe'),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.blue,
      ),
      alignment: Alignment.topCenter,
      constraints: BoxConstraints(maxHeight: 80, maxWidth: 120),
    );
  }
}
