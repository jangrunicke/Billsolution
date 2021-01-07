import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/location.dart';
import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:billsolution_app/aggregates/bill/vendor.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/services/bill_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/add_bill_widgets.dart';
import 'add_bill_position.dart';

class AddBillPopup extends StatelessWidget {
  TextEditingController addShopNameController = new TextEditingController();
  TextEditingController addShopVendorNameController =
      new TextEditingController();
  TextEditingController addShopVendorCategoryController =
      new TextEditingController();
  TextEditingController addShopLocationStreetController =
      new TextEditingController();
  TextEditingController addShopLocationCityController =
      new TextEditingController();
  TextEditingController addShopLocationZipController =
      new TextEditingController();
  TextEditingController addShopLocationCountryController =
      new TextEditingController();
  TextEditingController addBillDateController = new TextEditingController();
  TextEditingController addShopBillIdController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Beleg \n hinzufügen', 86),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView(children: [
          AddBillInputField('Shop', addShopNameController),
          AddBillInputField('Straße', addShopLocationStreetController),
          AddBillInputField('Postleitzahl', addShopLocationZipController),
          AddBillInputField('Stadt', addShopLocationCityController),
          AddBillInputField('Land', addShopLocationCountryController),
          AddBillInputField('Vendor Name', addShopVendorNameController),
          AddBillInputField(
              'Vendor Kategorie', addShopVendorCategoryController),
          AddBillInputField('Bill ID', addShopBillIdController),
          AddBillInputField('Datum', addBillDateController),
          HinzufuegenButton(
            () {
              var inputDate =
                  DateFormat("dd.MM.yyyy").parse(addBillDateController.text);

              var outputDate =
                  DateFormat("yyyy-MM-dd").parse("$inputDate").toString();

              DateTime newDate = DateTime.parse(outputDate);

              Location newLocation = Location(
                  street: addShopLocationStreetController.text,
                  city: addShopLocationCityController.text,
                  zip: addShopLocationZipController.text,
                  country: addShopLocationCountryController.text);

              Vendor newVendor = Vendor(
                  name: addShopVendorNameController.text,
                  category: addShopVendorCategoryController.text);

              Shop newShop = Shop(
                  name: addShopNameController.text,
                  location: newLocation,
                  vendor: newVendor);

              Bill newBill = new Bill(
                created_at: newDate,
                shopBillId: addShopBillIdController.text,
                shop: newShop,
              );

              Route route =
                  MaterialPageRoute(builder: (context) => AddBillPosition());
              Navigator.push(context, route);
            },
          ),
        ]),
      ),
    );
  }
}
