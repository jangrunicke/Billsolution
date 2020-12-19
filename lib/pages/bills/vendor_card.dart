import 'package:flutter/material.dart';

class VendorCard extends StatelessWidget {
  final String vendorName;
  final Color cardColor;

  VendorCard(this.vendorName, this.cardColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        vendorName,
        style:
            TextStyle(fontSize: 20, color: Color.fromRGBO(250, 250, 250, 1.0)),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              blurRadius: 4.0, offset: Offset(0.0, 4.0), color: Colors.grey)
        ],
      ),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),
      constraints: BoxConstraints(maxHeight: 100, maxWidth: 140),
    );
  }
}
