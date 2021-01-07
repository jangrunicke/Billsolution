import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/services/bill_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/add_bill_widgets.dart';
import 'add_bill_position.dart';

class AddBillPopup extends StatelessWidget {
  TextEditingController addShopNameController = new TextEditingController();
  TextEditingController addBillDateController = new TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Beleg \n hinzufügen', 86),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 30,
            ),
            AddBillInputField('Shop', addShopNameController),
            AddBillInputField('Datum', addBillDateController),
            HinzufuegenButton(
              () {
                var inputDate =
                    DateFormat("dd.MM.yyyy").parse(addBillDateController.text);

                var outputDate =
                    DateFormat("yyyy-MM-dd").parse("$inputDate").toString();

                DateTime newDate = DateTime.parse(outputDate);

                Shop newShop = Shop(name: addShopNameController.text);

                Bill newBill = new Bill(created_at: newDate, shop: newShop);

                print(newBill.created_at);
                print(newBill.shop);

                Route route =
                    MaterialPageRoute(builder: (context) => AddBillPosition());
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
