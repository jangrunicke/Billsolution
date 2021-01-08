import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillDetails extends StatelessWidget {
  Bill _bill;

  BillDetails(this._bill);

  // final Stream<List<Billposition>> _positions =
  //     Stream<List<Billposition>>.fromIterable(<List<Billposition>>[
  //   [
  //     Billposition(
  //         name: 'Zahnpasta', amount: 10, price: 1.12, category: 'Hygiene'),
  //     Billposition(
  //         name: 'Milch', amount: 2, price: 1.42, category: 'Lebensmittel'),
  //     Billposition(
  //         name: 'Paprika', amount: 1, price: 1.02, category: 'Lebensmittel')
  //   ].toList()
  // ]);

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');

    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(_bill.shop.name),
              Text(formatter.format(_bill.created_at))
            ],
          ),
        ),
        body: Container(
            child: StreamBuilder(
          stream: _bill.getBillpositions(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Billposition>> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(child: Text(snapshot.data[index].productName)),
                        Flexible(
                            child: Text(snapshot.data[index].amount.toString()))
                      ],
                    ),
                    trailing: Text(snapshot.data[index].price.toString() + '€'),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            } else {
              return Text('Nichts');
            }
          },
        )));
  }
}
