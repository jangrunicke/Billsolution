import 'package:billsolution_app/pages/bills/models/vendor_filter_model.dart';
import 'package:billsolution_app/pages/bills/models/zeitraum_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VendorCard extends StatelessWidget {
  final String vendorName;
  final double summierteAusgaben;

  VendorCard(this.vendorName, this.summierteAusgaben);

  void _auswaehlen(BuildContext context) {
    var filterModel = context.read<VendorFilterModel>();
    filterModel.selectFilter(this.vendorName);
  }

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<VendorFilterModel>();

    return Container(
      child: FlatButton(
        child: Column(
          children: [
            Text(
              vendorName + ':',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.normal),
            ),
            Container(
              margin: EdgeInsets.all(10),
            ),
            Text(summierteAusgaben.toStringAsFixed(2) + ' €',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.normal))
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        onPressed: () => _auswaehlen(context),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: filter.selectedFilter == this.vendorName
            ? Color.fromRGBO(29, 53, 87, 1.0)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          filter.selectedFilter == this.vendorName
              ? BoxShadow()
              : BoxShadow(
                  blurRadius: 4.0, offset: Offset(0.0, 4.0), color: Colors.grey)
        ],
      ),
      padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
      constraints: BoxConstraints(minWidth: 150),
    );
  }
}
