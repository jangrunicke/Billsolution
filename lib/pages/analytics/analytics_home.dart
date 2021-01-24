import 'package:billsolution_app/pages/analytics/analytics_category_card.dart';
import 'package:billsolution_app/pages/analytics/analytics_pichart.dart';
import 'package:billsolution_app/pages/analytics/widgets/analytics_category_list.dart';

import 'package:flutter/material.dart';

class AnalyticsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
        appBar: AppBar(
          title: Text(
            'Auswertung',
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnalyticsCategoryCard(
                category: 'Gesamt',
                color: Theme.of(context).primaryColor,
              ),
              AnalyticsPiChart(),
              Expanded(
                child: AnalyticsCategoryList(),
              )
            ],
          ),
        ));
  }
}
