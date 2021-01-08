import 'dart:async';

import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/pages/analytics/analytics_category_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../user_model.dart';

class AnalyticsHome extends StatelessWidget {
  // aggreagtion(Stream<List<Bill>> stream, String category) {}

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
          padding: const EdgeInsets.all(36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnalyticsCategoryCard(
                category: 'Lebensmittel',
              )
            ],
          ),
        ),
      )),
    );
  }
}
