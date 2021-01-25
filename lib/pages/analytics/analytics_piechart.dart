import 'dart:math';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class AnalyticsPieChart extends StatelessWidget {
  static int _roundPercent(double ergebnis) {
    double mod = pow(10.0, 2);
    return ((ergebnis * mod) ~/ mod);
  }

  List<PieChartPos> setcolors(List<PieChartPos> piechart) {
    int counter = 0;

    List<PieChartPos> pie = piechart;
    pie.sort((a, b) => a.categorty.compareTo(b.categorty));
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

    pie.forEach((element) {
      element.color = colors[counter];
      counter = counter + 1;
    });
    return pie;
  }

  List<charts.Series<PieChartPos, String>> _generateData(
      List<PieChartPos> piechartData) {
    var colorizedData = setcolors(piechartData);
    double gesamt = 0;
    piechartData.forEach(
      (element) {
        gesamt = gesamt + element.sum;
      },
    );
    return [
      charts.Series<PieChartPos, String>(
        id: 'Piechart',
        data: colorizedData,
        domainFn: (PieChartPos piechartpos, _) => piechartpos.categorty,
        measureFn: (PieChartPos piechartpos, _) => piechartpos.sum,
        colorFn: (PieChartPos piechartpos, _) =>
            charts.ColorUtil.fromDartColor(piechartpos.color),
        labelAccessorFn: (PieChartPos row, _) =>
            '${row.categorty} ${_roundPercent((row.sum / gesamt * 100))}%',
      )
    ];
  }

  piechart(List<PieChartPos> piechartData) {
    return charts.PieChart(
      _generateData(piechartData),
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
                AsyncSnapshot<List<PieChartPos>> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (!snapshot.hasData) {
                return Text('Empty');
              }
              List<PieChartPos> list = new List<PieChartPos>();
              snapshot.data.forEach(
                (element) {
                  list.add(element);
                },
              );
              return piechart(list);
            },
          );
        },
      ),
    );
  }
}

class PieChartPos {
  String categorty;
  double sum;
  Color color;

  PieChartPos({this.categorty, this.sum});
}
