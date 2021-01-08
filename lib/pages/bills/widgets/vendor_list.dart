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

  _buildList(Set<Vendor> vendors) {
    List<VendorCard> cards = List<VendorCard>();
    if (vendors != null) {
      vendors.forEach((vendor) {
        cards.add(VendorCard(vendor.name, colors[3], rng.nextDouble()));
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
                        stream: snapshot.data
                            .getBills()
                            .map((list) =>
                                list.map((Bill bill) => bill.shop.vendor))
                            .map((list) => list.toSet()),
                        builder: (BuildContext context,
                            AsyncSnapshot<Set<Vendor>> snapshot) {
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
