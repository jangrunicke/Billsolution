import 'dart:math';

import 'package:billsolution_app/pages/bills/models/vendor_filter_model.dart';
import 'package:billsolution_app/pages/bills/models/zeitraum_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/vendor_list.dart';
import 'widgets/zeitraum_filter.dart';
import 'add_bill.dart';
import './belege_liste.dart';

class BillsHome extends StatelessWidget {
  final mockData = ['Rewe', 'DM', 'Edeka', 'Penny', 'Aldi'];

  final colors = [
    Color.fromRGBO(230, 57, 70, 1.0),
    Color.fromRGBO(168, 218, 220, 1.0),
    Color.fromRGBO(254, 168, 168, 1.0),
    Color.fromRGBO(69, 123, 157, 1.0),
    Color.fromRGBO(255, 33, 0, 1.0),
  ];

  final rng = new Random();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ZeitraumfilterModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => VendorFilterModel(),
        )
      ],
      child: Scaffold(
          backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
          appBar: AppBar(
            title: Text('Belege'),
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => AddBillPopup());
                    Navigator.push(context, route);
                  }),
            ],
          ),
          body: Column(
            children: [
              Zeitraumfilter(),
              VendorList(),
              BelegeListe(),
            ],
          )),
    );
  }
}
