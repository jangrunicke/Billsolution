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

class AddBillPopup extends StatelessWidget {
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

  SelectGroupDropDown dropDown = new SelectGroupDropDown();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Beleg \n hinzufügen', 86),
      body: Column(
        children: [
          Container(
            height: 600,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: ListView(
                children: <Widget>[
                  AddBillInputField('Shop', addShopNameController),
                  AddBillInputField('Straße', addShopLocationStreetController),
                  AddBillInputField(
                      'Postleitzahl', addShopLocationZipController),
                  AddBillInputField('Stadt', addShopLocationCityController),
                  AddBillInputField('Land', addShopLocationCountryController),
                  AddBillInputField('Vendor Name', addShopVendorNameController),
                  dropDown,
                  // AddBillInputField(
                  //     'Vendor Kategorie', addShopVendorCategoryController),
                  AddBillInputField('Bill ID', addShopBillIdController),
                  AddBillInputField('Datum', addBillDateController),
                ],
              ),
            ),
          ),
          StreamBuilder(
              stream: UserService.instance.findById('hVPLNhZ4UBfJdPWkemK3'),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: HinzufuegenButton(
                        label: 'Hinzufügen',
                        onPressed: () async {
                          try {
                            User latestUser = snapshot.data;
                            var inputDate = DateFormat("dd.MM.yyyy")
                                .parse(addBillDateController.text);

                            var outputDate = DateFormat("yyyy-MM-dd")
                                .parse("$inputDate")
                                .toString();

                            DateTime newDate = DateTime.parse(outputDate);

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

                            Route route = MaterialPageRoute(
                                builder: (context) =>
                                    AddBillPositionDetails(bill));
                            Navigator.push(context, route);
                          } catch (error) {
                            print(error.toString());
                          }
                        }),
                  );
                }
                return Text('Waiting');
              }),
        ],
      ),
    );
  }
}
