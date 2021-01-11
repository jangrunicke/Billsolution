import 'package:billsolution_app/repositorys/bill_repository.dart';
import 'package:billsolution_app/services/billposition_service.dart';
import 'package:flutter/material.dart';
import './widgets/add_bill_widgets.dart';
import './add_position_details.dart';
import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/services/billposition_service.dart';

class AddBillPosition extends StatelessWidget {
  Bill bill;

  AddBillPosition(this.bill);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Positionen', 56.0),
      body: Container(
        height: 2000,
        child: ListView(
          children: [
            StreamBuilder(
                stream: //BillRepository().findById('1G24s8w7KybrbYttRo4C'),
                    bill.getBillpositions(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Billposition>> snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    return Container(
                        height: 1500,
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(snapshot.data[index].productName);
                            }));
                  }
                  return Text('empty');
                }),
            Padding(
              padding: EdgeInsets.fromLTRB(35, 35, 35, 15),
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
          ],
        ),
      ),
    );
  }
}
