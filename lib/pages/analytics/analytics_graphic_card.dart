import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AnalyticsGraphicCard extends StatelessWidget {
  Stream<double> stream;
  AnalyticsGraphicCard({this.stream});

  static double _getReferenz(double betrag) {
    int referenz = (betrag ~/ 100);
    return (referenz * 100 + 100).toDouble();
  }

  static List<charts.Series<Billposition, String>> _generateData(
      String betrag) {
    double doubleBetrag = double.parse(betrag);
    final desktopSaleData = [
      Billposition(category: '', price: _getReferenz(doubleBetrag)),
      Billposition(category: '', price: doubleBetrag),
    ];
    return [
      charts.Series<Billposition, String>(
        id: 'Sales',
        domainFn: (Billposition billposition, _) => billposition.category,
        measureFn: (Billposition billposition, _) => billposition.price,
        data: desktopSaleData,
      )
    ];
  }

  barchart(String streamString) {
    return charts.BarChart(
      _generateData(streamString),
      animate: true,
      vertical: false,
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, AsyncSnapshot<double> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return Text('Empty');
        }
        return Container(
            width: 350, height: 22, child: barchart(snapshot.data.toString()));
      },
    );
  }
}

class Billposition {
  final String category;
  final double price;

  Billposition({this.category, this.price});
}
