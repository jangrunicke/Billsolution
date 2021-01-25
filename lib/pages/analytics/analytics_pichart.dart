import 'dart:collection';
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

  List<PiChartPos> setcolors(List<PiChartPos> pichart) {
    int counter = 0;

    List<PiChartPos> pi = pichart;
    pi.sort((a, b) => a.categorty.compareTo(b.categorty));
    List<Color> colors = [
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.blue,
      Colors.purple,
      Colors.brown,
      Colors.grey,
      Colors.lightGreen,
      Colors.pink,
      Colors.teal,
      Colors.deepOrange,
    ];

    pi.forEach((element) {
      element.color = colors[counter];
      counter = counter + 1;
    });
    return pi;
  }

  List<charts.Series<PiChartPos, String>> _generateData(
      List<PiChartPos> pichartData) {
    var mockdata = [
      PiChartPos(categorty: 'Auto', sum: 20),
      PiChartPos(categorty: 'Büroartikel', sum: 50),
    ];

    var colormockdata = setcolors(pichartData);
    return [
      charts.Series<PiChartPos, String>(
        id: 'Pichart',
        data: colormockdata,
        //data: pichartData,
        domainFn: (PiChartPos pichartpos, _) => pichartpos.categorty,
        measureFn: (PiChartPos pichartpos, _) => pichartpos.sum,
        colorFn: (PiChartPos pichartpos, _) =>
            charts.ColorUtil.fromDartColor(pichartpos.color),
        labelAccessorFn: (PiChartPos row, _) => '${row.categorty}',
      )
    ];
  }

  pichart(List<PiChartPos> pichartData) {
    return charts.PieChart(
      _generateData(pichartData),
      animate: true,
      //animationDuration: Duration(seconds: 3),
      defaultRenderer: new charts.ArcRendererConfig(
          arcWidth: 100,
          arcRendererDecorators: [
            new charts.ArcLabelDecorator(
                labelPosition: charts.ArcLabelPosition.outside)
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      // child: pichart([]),
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
              List<PiChartPos> list = new List<PiChartPos>();
              snapshot.data.forEach(
                (element) {
                  list.add(element);
                },
              );
              return pichart(list);
            },
          );
        },
      ),
    );
  }
}

class PiChartPos {
  String categorty;
  double sum;
  Color color;

  PiChartPos({this.categorty, this.sum});
}
