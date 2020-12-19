import 'package:flutter/material.dart';
import './vendor_card.dart';

class BillsHome extends StatelessWidget {
  var mockData = ['Rewe', 'DM', 'Edeka', 'Penny', 'Aldi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Belege'),
        ),
        body: Container(
          constraints: BoxConstraints(maxHeight: 140),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              itemCount: mockData.length,
              itemBuilder: (BuildContext context, int index) {
                return VendorCard(mockData[index]);
              }),
        ));
  }
}
