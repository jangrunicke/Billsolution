import 'dart:math';

import 'package:flutter/material.dart';

import './vendor_card.dart';
import './vendor_list.dart';

class BillsHome extends StatelessWidget {
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Belege'),
        ),
        body: VendorList());
  }
}
