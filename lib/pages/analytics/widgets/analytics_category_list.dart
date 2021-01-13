import 'package:flutter/material.dart';

import '../analytics_category_card.dart';

class AnalyticsCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnalyticsCategoryCard(category: 'Lebensmittel', color: Colors.green),
          AnalyticsCategoryCard(
            category: 'Hygiene',
            color: Colors.blue,
          ),
          AnalyticsCategoryCard(
            category: 'Reisen',
            color: Colors.red,
          ),
          AnalyticsCategoryCard(
            category: 'Auto',
            color: Colors.pink,
          ),
        ],
      ),
    );
  }
}
