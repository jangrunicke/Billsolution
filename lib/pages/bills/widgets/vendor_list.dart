import 'dart:async';
import 'dart:math';
import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/vendor.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/pages/bills/models/zeitraum_filter_model.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'vendor_card.dart';

class VendorList extends StatefulWidget {
  @override
  _VendorListState createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  List<Vendor> _getDistinctVendors(List<Bill> bills) {
    var vendornames = List<String>();
    var vendors = List<Vendor>();
    bills.map((bill) => bill.shop.vendor).forEach((vendor) {
      if (!vendornames.contains(vendor.name)) {
        vendornames.add(vendor.name);
        vendors.add(vendor);
      }
    });
    return vendors;
  }

  // VendorCardData _calculateVendorCardData(Stream<Bill> stream, String vendor) {
  //   var aggPrice = 0.0;

  //   StreamBuilder(
  //     stream: stream.where((bill) => bill.shop.vendor.name == vendor),
  //     builder: (BuildContext context, AsyncSnapshot<Bill> snapshot) {
  //       snapshot.data.getCalculatedSum().listen((sum) {

  //       }).onDone(() {
  //         return VendorCardData(name: vendor, aggPrice: 2.0);
  //       });
  //     },
  //   );
  // }

  // List<VendorCardData> _getVendorCardData(
  //     List<Bill> bills, List<String> vendors) {
  //   var result = List<VendorCardData>();
  //   var stream = Stream<Bill>.fromIterable(bills);

  //   vendors.forEach((vendor) {
  //     // result.add(_calculateVendorCardData(stream, vendor));

  //     double aggPrice = 0;

  //     bills.forEach((bill) async {
  //       if (bill.shop.vendor.name == vendor) {
  //         var sum = 0.0;
  //         await for (var value in bill.getCalculatedSum()) {
  //           sum += value;
  //         }
  //         aggPrice += sum;
  //       }
  //     });

  //     result.add(VendorCardData(name: vendor, aggPrice: aggPrice));
  //   });

  //   result.sort((a, b) => a.aggPrice.compareTo(b.aggPrice));
  //   var orderedResult = result.reversed.toList();
  //   return orderedResult;
  // }

  // List<Bill> _filterBillList(List<Bill> bills, DateTime lastValidDate) {
  //   var zeitfilter = context.read<ZeitraumfilterModel>();
  //   var lastValidDate = zeitfilter.getLastValidDate();
  //   var filteredBills = List<Bill>();

  //   bills.forEach((bill) {
  //     if (bill.created_at.isAfter(lastValidDate)) {
  //       filteredBills.add(bill);
  //     }
  //   });

  //   return filteredBills;
  // }

  Widget _buildVendorCard(Vendor vendor, DateTime lastValidDate) {
    var zeitraumfilter = context.read<ZeitraumfilterModel>();
    var lastValidDate = zeitraumfilter.getLastValidDate();

    return Consumer<User>(builder: (context, user, child) {
      if (user != null) {
        return StreamBuilder(
            stream:
                user.calculatedSumOfVendor(vendor, startingAt: lastValidDate),
            builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                return VendorCard(vendor.name, snapshot.data);
              }
              return Text('Waiting inner');
            });
      }
    });
  }

  Widget _buildList(List<Bill> bills, DateTime lastValidDate) {
    if (bills != null) {
      List<Vendor> vendors = _getDistinctVendors(bills);

      var cards = List<Widget>();

      vendors.forEach((vendor) {
        cards.add(_buildVendorCard(vendor, lastValidDate));
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
    var zeitraumfilter = context.watch<ZeitraumfilterModel>();
    var lastValidDate = zeitraumfilter.getLastValidDate();

    return Container(
        constraints: BoxConstraints(maxHeight: 140),
        child: Consumer<User>(
          builder: (context, user, child) {
            if (user != null) {
              return StreamBuilder(
                  stream: user.getBills(),
                  // .map((list) =>
                  //     list.map((Bill bill) => bill.shop.vendor))
                  // .map((list) => list.toList()),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Bill>> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error.toString());
                    }
                    return _buildList(snapshot.data, lastValidDate);
                  });
            }
          },
        ));
  }
}

class VendorCardData {
  String name;
  double aggPrice;

  VendorCardData({this.name, this.aggPrice});
}
