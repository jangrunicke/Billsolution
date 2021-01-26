/*
  Eine Klasse zum manuellen Hinzufügen von Belegen 
 */

import 'dart:ui';

import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/location.dart';
import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:billsolution_app/aggregates/bill/vendor.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/pages/bills/add_position_details.dart';
import 'package:billsolution_app/pages/bills/select_group_dropdown.dart';
import 'package:billsolution_app/services/bill_service.dart';
import 'package:billsolution_app/services/user_service.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/add_bill_widgets.dart';
import 'add_bill_position.dart';
import 'package:provider/provider.dart';

class AddBill extends StatelessWidget {
  final TextEditingController addShopNameController =
      new TextEditingController();
  final TextEditingController addShopVendorNameController =
      new TextEditingController();
  final TextEditingController addShopVendorCategoryController =
      new TextEditingController();
  final TextEditingController addShopLocationStreetController =
      new TextEditingController();
  final TextEditingController addShopLocationCityController =
      new TextEditingController();
  final TextEditingController addShopLocationZipController =
      new TextEditingController();
  final TextEditingController addShopLocationCountryController =
      new TextEditingController();
  final TextEditingController addBillDateController =
      new TextEditingController();
  final TextEditingController addShopBillIdController =
      new TextEditingController();

/*
  Ein Dropdown um die Kategorie des Händlers auszuwählen
  (siehe select_group_dropdown.dart)
 */
  SelectGroupDropDown dropDown =
      new SelectGroupDropDown('Kategorie des Händlers');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Beleg \n hinzufügen', 86),
      body: Column(
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: ListView(
                children: <Widget>[
                  AddBillInputField(
                    'Shop',
                    addShopNameController,
                  ),
                  AddBillInputField(
                    'Straße',
                    addShopLocationStreetController,
                  ),
                  AddBillInputField(
                    'Postleitzahl',
                    addShopLocationZipController,
                  ),
                  AddBillInputField(
                    'Stadt',
                    addShopLocationCityController,
                  ),
                  AddBillInputField(
                    'Land',
                    addShopLocationCountryController,
                  ),
                  AddBillInputField('Händler', addShopVendorNameController,
                      hintText: 'Name des Händlers: z.B Edeka'),
                  dropDown,
                  AddBillInputField('Bill ID', addShopBillIdController,
                      hintText: 'Steuernummer des Kassenzettels  '),
                  AddBillInputField(
                    'Datum',
                    addBillDateController,
                    hintText: 'z.B 17.09.2020',
                  ),
                ],
              ),
            ),
          ),
          /*
            Hier wird auf der neusten Instanz des Users die Funktion
            addBill(bill) aufgerufen, wobei der Parameter bill, eine Instanz
            der Bill-Klasse, aus den Werten der TextInputs erstellt wird
           */
          Consumer<User>(builder: (context, user, child) {
            if (user != null) {
              return Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: HinzufuegenButton(
                    label: 'Hinzufügen',
                    onPressed: () async {
                      try {
                        User latestUser = user;

                        /*
                          Falls Felder keinen Wert besitzen soll ein Popup 
                          mit einer Fehlermeldung angezeigt werden 
                         */
                        if (addShopNameController.text == "" ||
                            addBillDateController.text == "" ||
                            addShopBillIdController.text == "" ||
                            addShopLocationCityController.text == "" ||
                            addShopLocationCountryController.text == "" ||
                            addShopLocationStreetController.text == "" ||
                            addShopLocationZipController.text == "" ||
                            addShopNameController.text == "" ||
                            addShopVendorNameController.text == "") {
                          return showDialog(
                            barrierColor: Color.fromARGB(210, 0, 0, 0),
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor:
                                    Color.fromARGB(255, 29, 53, 87),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Container(
                                  width: 400,
                                  height: 200,
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 20, 25, 20),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 0, 20),
                                            child: Icon(
                                              Icons.error_outline_outlined,
                                              color: Colors.red,
                                              size: 50,
                                            ),
                                          ),
                                          Center(
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 15),
                                              child: Text(
                                                'Zum Anlegen eines Belegs müssen alle Felder befüllt sein !',
                                                style: TextStyle(
                                                    fontFamily: 'SF Pro Text',
                                                    color: Colors.white),
                                                textAlign: TextAlign.left,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ),
                              );
                            },
                          );
                        } else {
                          DateTime newDate;
                          if (addBillDateController.text != null) {
                            var inputDate = DateFormat("dd.MM.yyyy")
                                .parse(addBillDateController.text);

                            var outputDate = DateFormat("yyyy-MM-dd")
                                .parse("$inputDate")
                                .toString();

                            newDate = DateTime.parse(outputDate);
                          }

                          Location newLocation = Location(
                              street: addShopLocationStreetController.text,
                              city: addShopLocationCityController.text,
                              zip: addShopLocationZipController.text,
                              country: addShopLocationCountryController.text);

                          Vendor newVendor = Vendor(
                            name: addShopVendorNameController.text,
                            category: dropDown.getCurrentValue(),
                          );

                          Shop newShop = Shop(
                              name: addShopNameController.text,
                              location: newLocation,
                              vendor: newVendor);

                          Bill newBill = new Bill(
                            created_at: newDate,
                            shopBillId: addShopBillIdController.text,
                            shop: newShop,
                          );

                          Bill bill = await latestUser.addBill(newBill);

                          print(dropDown.getCurrentValue());
                          print(bill.id);

                          /*
                            gebe die bill Instanz an den nächsten Screen AddBillPositionDetails weiter
                            und navigiere dorthin
                          */
                          Route route = MaterialPageRoute(
                              builder: (context) =>
                                  AddBillPositionDetails(bill));
                          Navigator.push(context, route);
                        }
                      } catch (error) {
                        print(error.toString());
                      }
                    }),
              );
            }
          }),
        ],
      ),
    );
  }
}
