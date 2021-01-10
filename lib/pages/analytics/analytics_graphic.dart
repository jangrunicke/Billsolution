import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsDemo extends StatefulWidget {
  //
  ChartsDemo({this.betrag}) : super();

  final String title = 'Charts Demo';
  final String betrag;

  @override
  _ChartsDemoState createState() => _ChartsDemoState(betrag: this.betrag);
}

class _ChartsDemoState extends State<ChartsDemo> {
  //

  List<charts.Series> seriesList;

  String betrag;
  _ChartsDemoState({this.betrag});

  static List<charts.Series<Billposition, String>> _createRandomData(betrag) {
    double doublebetrag = double.parse(betrag);
    final desktopSaleData = [
      Billposition(category: '', price: 300),
      Billposition(category: '', price: doublebetrag),
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

  barchart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
      domainAxis: charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = _createRandomData(betrag);
  }

  @override
  Widget build(BuildContext context) {
    return Container(width: 500, height: 22, child: barchart());
  }
}

class Billposition {
  final String category;
  final double price;

  Billposition({this.category, this.price});
}
