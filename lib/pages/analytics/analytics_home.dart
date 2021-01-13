import 'dart:async';

import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/components/secondary_button.dart';
import 'package:billsolution_app/pages/analytics/analytics_category_card.dart';
import 'package:billsolution_app/pages/analytics/widgets/analytics_category_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../user_model.dart';
import 'analytics_router.dart';

class AnalyticsHome extends StatelessWidget {
  // aggreagtion(Stream<List<Bill>> stream, String category) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnalyticsCategoryList(),
        ],
      ),
    );
  }
}
