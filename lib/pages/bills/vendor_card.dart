import 'package:flutter/material.dart';

class VendorCard extends StatelessWidget {
  final String vendorName;

  VendorCard(this.vendorName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(vendorName),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      constraints: BoxConstraints(maxHeight: 100, maxWidth: 140),
    );
  }
}
