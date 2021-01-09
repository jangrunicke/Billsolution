import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../user_model.dart';

class AnalyticsCategoryCard extends StatelessWidget {
  final String category;

  AnalyticsCategoryCard({this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 150,
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
      child: Column(children: [
        Text(category),
        Consumer<UserModel>(
          builder: (context, user, child) {
            return StreamBuilder(
                stream: user.user,
                builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (!snapshot.hasData) {
                    return Text('Empty');
                  }
                  return StreamBuilder(
                      stream: snapshot.data.getBills(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Bill>> snapshot) {
                        if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }
                        if (!snapshot.hasData) {
                          return Text('Empty');
                        }
                        // return Text(snapshot.data.toString());
                        return StreamBuilder(
                          stream: snapshot.data.first
                              .getCalculatedSumOfCategory(category),
                          builder: (BuildContext context,
                              AsyncSnapshot<double> snapshot) {
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            }
                            if (!snapshot.hasData) {
                              return Text('Empty');
                            }
                            return Text(snapshot.data.toString());
                          },
                        );
                      });
                });
          },
        )
      ]),
    );
  }
}
