import 'dart:math';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class AnalyticsPiChart extends StatelessWidget {
  static int _roundPercent(double ergebnis) {
    double mod = pow(10.0, 2);
    return ((ergebnis * mod) ~/ mod);
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
    var colorizeddata = setcolors(pichartData);
    double gesamt = 0;
    pichartData.forEach(
      (element) {
        gesamt = gesamt + element.sum;
      },
    );
    return [
      charts.Series<PiChartPos, String>(
        id: 'Pichart',
        data: colorizeddata,
        domainFn: (PiChartPos pichartpos, _) => pichartpos.categorty,
        measureFn: (PiChartPos pichartpos, _) => pichartpos.sum,
        colorFn: (PiChartPos pichartpos, _) =>
            charts.ColorUtil.fromDartColor(pichartpos.color),
        labelAccessorFn: (PiChartPos row, _) =>
            '${row.categorty} ${_roundPercent((row.sum / gesamt * 100))}%',
      )
    ];
  }

  pichart(List<PiChartPos> pichartData) {
    return charts.PieChart(
      _generateData(pichartData),
      animate: true,
      //animationDuration: Duration(seconds: 3),
      defaultRenderer:
          new charts.ArcRendererConfig(arcWidth: 100, arcRendererDecorators: [
        new charts.ArcLabelDecorator(
            labelPosition: charts.ArcLabelPosition.outside),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
