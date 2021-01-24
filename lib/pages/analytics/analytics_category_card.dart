import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/pages/analytics/analytics_graphic_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnalyticsCategoryCard extends StatelessWidget {
  final String category;
  final Color color;

  AnalyticsCategoryCard({
    this.category,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Container(
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
              if (category == 'Gesamt') {
                return StreamBuilder(
                  stream: user.calculateSum(),
                  builder: (context, AsyncSnapshot<double> snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    if (!snapshot.hasData) {
                      return Text('Empty');
                    }
                    return Column(
                      children: <Widget>[
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              category,
                            ),
                          ],
                        ),
                        AnalyticsGraphicCard(
                          stream: user.calculateSum(),
                          color: color,
                        ),
                        SizedBox(height: 40),
                      ],
                    );
                  },
                );
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 5),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            category,
                          ),
                        ],
                      ),
                      AnalyticsGraphicCard(
                        stream: user.calculateSumOfCategory(category),
                        color: color,
                      ),
                      SizedBox(height: 40.0),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
