import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:flutter/material.dart';
import 'widgets/add_bill_widgets.dart';
import 'add_bill_position.dart';

class AddBillPopup {
  void openPopup(BuildContext context) {
    TextEditingController addShopNameController = new TextEditingController();
    TextEditingController addBillDateController = new TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              width: 340,
              height: 425,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                          alignment: Alignment.topRight,
                          iconSize: 25.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Beleg hinzufügen',
                          style: TextStyle(
                            fontFamily: 'Avenir Next',
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AddBillInputField('Shop', addShopNameController),
                    AddBillInputField('Datum', addBillDateController),
                    HinzufuegenButton(
                      () {
                        DateTime newDate =
                            DateTime.parse(addBillDateController.text);
                        Shop newShop = Shop(name: addShopNameController.text);

                        Bill newBill =
                            new Bill(created_at: newDate, shop: newShop);

                        Route route = MaterialPageRoute(
                            builder: (context) => AddBillPosition());
                        Navigator.push(context, route);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
