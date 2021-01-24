import 'dart:math';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class AnalyticsPiChart extends StatelessWidget {
  List<String> _getDistinctCategories(List<String> cats) {
    var categorynames = List<String>();
    cats.forEach((category) {
      if (!categorynames.contains(category)) {
        categorynames.add(category);
      }
    });
    categorynames.sort();
    return categorynames;
  }

  static double _roundDouble(String ergebnis) {
    double sum = double.parse(ergebnis);
    double mod = pow(10.0, 2);
    return ((sum * mod).round().toDouble() / mod);
  }

  // List<charts.Series<PiChartPos, String>> _generateData(
  //     List<PiChartPos> pichartData) {
  //
  //   return [
  //     charts.Series<PiChartPos, String>(
  //       id: 'Pichart',
  //       data: pichartData,
  //       domainFn: (PiChartPos pichartpos, _) => pichartpos.categorty,
  //       measureFn: (PiChartPos pichartpos, _) => pichartpos.sum,
  //     )
  //   ];
  // }

  // pichart(List<PiChartPos> pichartData) {
  //   return charts.PieChart(
  //     _generateData(pichartData),
  //     animate: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<User>(
        builder: (context, user, child) {
          if (user == null) {
            return Text('Waiting');
          }
          return StreamBuilder(
              stream: user.getPieChartStream(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PiChartPos>> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return Text('Empty');
                }
                return Text('hallo');
              });
        },
      ),
    );
  }
}

// class PiChartPos {
//   String categorty;
//   double sum;

//   PiChartPos({this.categorty, this.sum});
// }
