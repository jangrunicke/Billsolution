import 'package:flutter/material.dart';
import './add_bill_popup_widgets.dart';

class AddBillPopup {
  void openPopup(BuildContext context) {
    //TextEditingController customController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              width: 340,
              height: 418,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
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
                    AddBillInputField('Name'),
                    AddBillInputField('Einkaufsort'),
                    HinzufuegenButton(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
