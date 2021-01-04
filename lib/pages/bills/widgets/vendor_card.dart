import 'package:billsolution_app/pages/bills/models/zeitraum_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorCard extends StatelessWidget {
  final String vendorName;
  final Color cardColor;
  final double summierteAusgaben;

  VendorCard(this.vendorName, this.cardColor, this.summierteAusgaben);

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<ZeitraumfilterModel>();
    double summierteAusgabenFinal;

    // var summierteAusgabenFinal = summierteAusgaben * 1000;
    switch (filter.ausgewaehlt.index) {
      case 0:
        summierteAusgabenFinal = summierteAusgaben * 1000 * 1;
        break;

      case 1:
        summierteAusgabenFinal = summierteAusgaben * 1000 * 0.1;
        break;

      case 2:
        summierteAusgabenFinal = summierteAusgaben * 1000 * 0.3;
        break;

      case 3:
        summierteAusgabenFinal = summierteAusgaben * 1000 * 0.5;
        break;

      case 4:
        summierteAusgabenFinal = summierteAusgaben * 1000 * 0.8;
        break;
    }

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
      constraints: BoxConstraints(maxWidth: 130),
    );
  }
}
