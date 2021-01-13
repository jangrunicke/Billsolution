import 'dart:math';

import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/components/secondary_button.dart';
import 'package:billsolution_app/pages/analytics/analytics_graphic_card.dart';
import 'package:billsolution_app/pages/analytics/widgets/analytics_details_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalyticsCategoryCard extends StatelessWidget {
  final String category;
  final Color color;

  AnalyticsCategoryCard({this.category, this.color});

  double roundDouble(String ergebnis) {
    double sum = double.parse(ergebnis);
    double mod = pow(10.0, 2);
    return ((sum * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: Container(
        width: 500,
        height: 184,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: Consumer<User>(
            builder: (context, user, child) {
              if (user == null) {
                return Text('Empty');
              }
              return StreamBuilder(
                stream: user.calculateSumOfCategory(category),
                builder: (context, AsyncSnapshot<double> snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (!snapshot.hasData) {
                    return Text('Empty');
                  }
                  return Column(children: <Widget>[
                    SizedBox(height: 5),
                    Text(
                      category,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    Text(roundDouble(snapshot.data.toString()).toString()),
                    AnalyticsGraphicCard(
                      stream: user.calculateSumOfCategory(category),
                      color: color,
                    ),
                    SizedBox(height: 50.0),
                    AnalyticsDetailsButton(
                      onPressed: null,
                      text: 'Details',
                    )
                  ]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
