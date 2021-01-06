import 'package:billsolution_app/pages/analytics/mock/billposition_class.dart';
import 'package:billsolution_app/pages/bills/mock/billposition_stream2.dart';
import 'package:flutter/material.dart';

class BillDetails extends StatefulWidget {
  // final mockData = [
  //   {'name': 'Weihnstephan Milch', 'anzahl': 10, 'preis': 20.87},
  //   {'name': 'Bergbauernmilch', 'anzahl': 10, 'preis': 13.99},
  //   {'name': 'Chiqita Banane', 'anzahl': 3, 'preis': 2.99},
  //   {'name': 'Zahnpasta', 'anzahl': 1, 'preis': 3.29},
  // ];

  @override
  _BillDetailsState createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  final Stream<List<Billposition>> _positions =
      Stream<List<Billposition>>.fromIterable(<List<Billposition>>[
    [
      Billposition(
          name: 'Zahnpasta', amount: 10, price: 1.12, category: 'Hygiene'),
      Billposition(
          name: 'Milch', amount: 2, price: 1.42, category: 'Lebensmittel'),
      Billposition(
          name: 'Paprika', amount: 1, price: 1.02, category: 'Lebensmittel')
    ].toList()
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [Text('Rewe Einkauf'), Text('27.12.2020')],
          ),
        ),
        body: Container(
            child: StreamBuilder(
          stream: _positions,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            if (snapshot.hasData) {
              return Text(snapshot.data[1].name);
            } else {
              return Text('Nichts');
            }
          },
        )));
  }
}
