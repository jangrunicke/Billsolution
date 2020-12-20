import 'package:flutter/material.dart';

class VendorCard extends StatelessWidget {
  final String vendorName;
  final Color cardColor;
  final double summierteAusgaben;

  VendorCard(this.vendorName, this.cardColor, this.summierteAusgaben);

  @override
  Widget build(BuildContext context) {
    var summierteAusgabenFinal = summierteAusgaben * 1000;

    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              vendorName + ':',
              style: TextStyle(
                  fontSize: 20, color: Color.fromRGBO(250, 250, 250, 1.0)),
            ),
            alignment: Alignment.topLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
          ),
          Container(
            child: Text(summierteAusgabenFinal.toStringAsFixed(2) + ' €',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            alignment: Alignment.bottomLeft,
          )
        ],
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
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
      constraints: BoxConstraints(maxHeight: 95, maxWidth: 140),
    );
  }
}
