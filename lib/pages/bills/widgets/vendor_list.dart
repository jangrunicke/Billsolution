import 'dart:math';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 140),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(10),
          itemCount: mockData.length,
          itemBuilder: (BuildContext context, int index) {
            return VendorCard(mockData[index], colors[index], rng.nextDouble());
          }),
    );
  }
}
