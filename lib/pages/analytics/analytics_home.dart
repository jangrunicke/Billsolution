import 'dart:async';

import 'package:billsolution_app/components/primary_button.dart';
import 'package:billsolution_app/pages/analytics/analytics_graphic.dart';
import 'package:billsolution_app/pages/analytics/analytics_router.dart';
import 'package:billsolution_app/pages/analytics/mock/billposition_class.dart';
import 'package:billsolution_app/pages/analytics/mock/billposition_stream.dart';
import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;

class AnalyticsHome extends StatelessWidget {
  Stream stream = new BillpositionStream().getStream();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Auswertung',
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
                onPressed: () {
                  return null;
                }),
          ],
        ),
        body: Center(
          child: Container(
            child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 350,
                        height: 500,
                        child: Container(
                            height: 20,
                            child: ChartsDemo(
                              betrag: 140,
                            ))),
                  ],
                )),
          ),
        ));
  }
}
