/*
  Klasse zum Anzeigen von Belegpositionen und der Möglichkeit
  zum weiteren Anlegen von Belegpositionen oder dem Anlegen des Belegs
 */

import 'package:billsolution_app/pages/bills/bills_home.dart';
import 'package:billsolution_app/repositorys/bill_repository.dart';
import 'package:billsolution_app/services/billposition_service.dart';
import 'package:flutter/material.dart';
import './widgets/add_bill_widgets.dart';
import './add_position_details.dart';
import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/services/billposition_service.dart';

class AddBillPosition extends StatelessWidget {
  final Bill bill;

  AddBillPosition(this.bill);

  Widget _buildPositons() {
    return Container(
      child: Column(
        children: [
          Expanded(
            /*
              Diese Klasse nimmt eine Bill Instanz entgegen und führt auf dieser die Funktion
              getBillPositions() auf, um einen Stream der Belegpositionen zu erhalten 
              und diese anzuzeigen
             */
            child: StreamBuilder(
              stream: bill.getBillpositions(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Billposition>> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Flexible(
                        child: ListView.separated(
                          padding: EdgeInsets.all(15),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      snapshot.data[index].productName,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'x' +
                                            snapshot.data[index].amount
                                                .toInt()
                                                .toString(),
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 18,
                                            color: Colors.grey),
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ],
                                ),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Text(
                                    (snapshot.data[index].price * 1.19)
                                            .toStringAsFixed(2) +
                                        '€',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        color: Colors.grey),
                                    textAlign: TextAlign.end,
                                  ),
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Text('Nichts');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

/*
  Hier werden die 2 Buttons zum weiteren Hinzufügen von Belegpositionen,
  bzw. dem Anlegen des Belegs definiert und designt
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Positionen', 56.0),
      body: Column(
        children: [
          Expanded(child: _buildPositons()),
          Padding(
            padding: EdgeInsets.fromLTRB(35, 35, 35, 5),
            child: Container(
              width: 426,
              height: 48,
              child: RaisedButton(
                elevation: 0,
                color: Color.fromARGB(110, 224, 224, 224),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => AddBillPositionDetails(bill));
                  Navigator.push(context, route);
                },
                child: Icon(
                  Icons.add,
                  size: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35, 0, 35, 15),
            child: HinzufuegenButton(
              label: 'Beleg hinzufügen',
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => BillsHome());
                Navigator.push(context, route);
              },
            ),
          )
        ],
      ),
    );
  }
}
