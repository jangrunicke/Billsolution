import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/pages/bills/add_bill_position.dart';
import 'package:flutter/material.dart';
import './widgets/add_bill_widgets.dart';
import 'package:billsolution_app/aggregates/bill/bill.dart';

class AddBillPositionDetails extends StatelessWidget {
  final TextEditingController productNameController =
      new TextEditingController();

  final TextEditingController amountController = new TextEditingController();

  final TextEditingController priceController = new TextEditingController();

  final TextEditingController taxController = new TextEditingController();

  final TextEditingController discountController = new TextEditingController();

  final TextEditingController categoryController = new TextEditingController();

  final Bill bill;

  AddBillPositionDetails(this.bill);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Position \n hinzufügen', 86),
      body: Column(
        children: [
          Container(
            height: 600,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 45, 10),
                  child: AddBillInputField(
                    'Name',
                    productNameController,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 5, 10),
                      child: Container(
                        width: 255,
                        alignment: Alignment.centerLeft,
                        child: AddBillInputField(
                          'Preis',
                          priceController,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 10, 20, 10),
                      child: Container(
                        width: 100,
                        alignment: Alignment.centerRight,
                        child: AddBillInputField(
                          'Anzahl',
                          amountController,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: AddBillInputField('Mwst.', taxController)),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                    child: AddBillInputField('Rabatt', discountController)),
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: AddBillInputField('Kategorie', categoryController)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: HinzufuegenButton(
                label: 'Hinzufügen',
                onPressed: () async {
                  Billposition newBillposition = Billposition(
                    productName: productNameController.text,
                    amount: double.parse(amountController.text),
                    price: double.parse(priceController.text),
                    tax: double.parse(taxController.text),
                    discount: double.parse(discountController.text),
                    category: categoryController.text,
                  );

                  await bill.addBillposition(newBillposition);

                  Route route = MaterialPageRoute(
                    builder: (context) => AddBillPosition(bill),
                  );
                  Navigator.push(context, route);
                }),
          ),
        ],
      ),
    );
  }
}
