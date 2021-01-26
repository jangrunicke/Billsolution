import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class AnalyticsGraphicCard extends StatelessWidget {
  final Stream<double> stream;
  final Color color;
  AnalyticsGraphicCard({this.stream, this.color});

  static double _getReferenz(double betrag) {
    int referenz = (betrag ~/ 100);
    return (referenz * 100 + 100).toDouble();
  }

  static double _roundDouble(String ergebnis) {
    double sum = double.parse(ergebnis);
    double mod = pow(10.0, 2);
    return ((sum * mod).round().toDouble() / mod);
  }

  /**
   * Funktion, welche die Daten für das Barchart generiert 
   */
  List<charts.Series<Billposition, String>> _generateData(String betrag) {
    double doubleBetrag = double.parse(betrag);
    final desktopSaleData = [
      Billposition(category: '', price: _getReferenz(doubleBetrag)),
      Billposition(category: '', price: doubleBetrag),
    ];
    return [
      charts.Series<Billposition, String>(
        id: 'Sales',
        data: desktopSaleData,
        domainFn: (Billposition billposition, _) => billposition.category,
        measureFn: (Billposition billposition, _) => billposition.price,
        colorFn: (Billposition billposition, _) =>
            charts.ColorUtil.fromDartColor(color),
        labelAccessorFn: (Billposition billposition, _) =>
            '${_roundDouble(billposition.price.toString()).toString()}' + '€',
      )
    ];
  }

  /**
   * Funktion, welche ein Barchart mit den generierten Daten erzeugt
   */
  barchart(String streamString) {
    return charts.BarChart(
      _generateData(streamString),
      animate: true,
      vertical: false,
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
      barRendererDecorator: new charts.BarLabelDecorator(
        labelAnchor: charts.BarLabelAnchor.end,
      ),
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
        return Container(height: 22, child: barchart(snapshot.data.toString()));
      },
    );
  }
}

class Billposition {
  final String category;
  final double price;

  Billposition({this.category, this.price});
}
