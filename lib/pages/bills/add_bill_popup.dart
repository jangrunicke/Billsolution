import 'package:billsolution_app/aggregates/bill/bill.dart';
<<<<<<< HEAD
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
=======
import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/services/bill_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
>>>>>>> 2bf99101d6208f45d1778e5829a138d9c4c1a65b
import 'widgets/add_bill_widgets.dart';
import 'add_bill_position.dart';

class AddBillPopup {
  void openPopup(BuildContext context) {
<<<<<<< HEAD
    TextEditingController addBillNameController = new TextEditingController();
    TextEditingController addShoppingPlaceController =
        new TextEditingController();

    var user = context.read<UserModel>();
=======
    TextEditingController addShopNameController = new TextEditingController();
    TextEditingController addBillDateController = new TextEditingController();
>>>>>>> 2bf99101d6208f45d1778e5829a138d9c4c1a65b

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
                        // var inputFormat = DateFormat("dd.MM.yyyy");
                        // var date1 = inputFormat.parse(addBillDateController.text);

                        // var outputFormat = DateFormat("yyyy-MM-dd");
                        // var date2 = outputFormat.parse("$date1").toString();

                        DateTime newDate =
                            DateTime.parse(addBillDateController.text);
                        Shop newShop = Shop(name: addShopNameController.text);

                        Bill newBill =
                            new Bill(created_at: newDate, shop: newShop);

                        print(newBill.created_at);
                        print(newBill.shop);

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
