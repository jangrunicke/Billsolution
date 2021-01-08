import 'dart:math';
import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/vendor.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'vendor_card.dart';

class VendorList extends StatefulWidget {
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  var mockData = ['Rewe', 'DM', 'Edeka', 'Penny', 'Aldi'];
  var colors = [
    Color.fromRGBO(230, 57, 70, 1.0),
    Color.fromRGBO(168, 218, 220, 1.0),
    Color.fromRGBO(254, 168, 168, 1.0),
    Color.fromRGBO(69, 123, 157, 1.0),
    Color.fromRGBO(255, 33, 0, 1.0),
  ];
  var rng = new Random();

  List<String> _getDistinctVendors(List<Bill> bills) {
    var vendors = List<String>();
    bills.map((bill) => bill.shop.vendor).forEach((vendor) {
      if (!vendors.contains(vendor.name)) {
        vendors.add(vendor.name);
      }
    });
    return vendors;
  }

  List<VendorCardData> _getVendorCardData(
      List<Bill> bills, List<String> vendors) {
    var result = List<VendorCardData>();
    vendors.forEach((vendor) {
      double aggPrice = 0;
      bills.forEach((bill) async {
        if (bill.shop.vendor.name == vendor) {
          var sum = 0.0;
          await for (var value in bill.getCalculatedSum()) {
            sum += value;
          }
          aggPrice += sum;
        }
      });
      result.add(VendorCardData(name: vendor, aggPrice: aggPrice));
    });
    return result;
  }

  _buildList(List<Bill> bills) {
    if (bills != null) {
      List<String> vendors = _getDistinctVendors(bills);
      List<VendorCardData> data = _getVendorCardData(bills, vendors);

      List<VendorCard> cards = List<VendorCard>();
      data.forEach((vendor) {
        cards.add(VendorCard(vendor.name, vendor.aggPrice));
      });
      return ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        children: [
          ...cards,
        ],
      );
    }

    return Text('Waiting');
  }

  @override
  Widget build(BuildContext context) {
    // var latestUser = context.watch<UserModel>();

    return Container(
        constraints: BoxConstraints(maxHeight: 140),
        child: Consumer<UserModel>(
          builder: (context, user, child) {
            return StreamBuilder(
                stream: user.user,
                builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    return StreamBuilder(
                        stream: snapshot.data.getBills(),
                        // .map((list) =>
                        //     list.map((Bill bill) => bill.shop.vendor))
                        // .map((list) => list.toList()),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Bill>> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error.toString());
                          }
                          return _buildList(snapshot.data);
                        });
                  }
                  return Text('No Data');
                });
          },
        ));
  }
}

class VendorCardData {
  String name;
  double aggPrice;

  VendorCardData({this.name, this.aggPrice});
}
