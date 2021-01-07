import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsDemo extends StatefulWidget {
  //
  ChartsDemo({this.betrag}) : super();

  final String title = 'Charts Demo';
  final double betrag;

  @override
  _ChartsDemoState createState() => _ChartsDemoState(betrag: this.betrag);
}

class _ChartsDemoState extends State<ChartsDemo> {
  //

  List<charts.Series> seriesList;
  double betrag;
  _ChartsDemoState({this.betrag});

  static List<charts.Series<Billposition, String>> _createRandomData(betrag) {
    final desktopSaleData = [
      Billposition(category: '', price: 300),
      Billposition(category: '', price: betrag),
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
    return charts.BarChart(seriesList,
        animate: true,
        vertical: false,
        domainAxis:
            charts.OrdinalAxisSpec(renderSpec: charts.NoneRenderSpec()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesList = _createRandomData(betrag);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 500,
        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: barchart(),
      ),
    );
  }
}

class Billposition {
  final String category;
  final double price;

  Billposition({this.category, this.price});
}
