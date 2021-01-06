import 'package:flutter/material.dart';
import './show_added_positions.dart';
import './widgets/add_bill_widgets.dart';
import './select_group_dropdown.dart';

class AddBillPositionDetails extends StatelessWidget {
  final TextEditingController nameController = new TextEditingController();

  final TextEditingController preisController = new TextEditingController();

  final TextEditingController anzahlController = new TextEditingController();

  final List<String> namen = List<String>();

  final List<String> preise = List<String>();

  final List<String> anzahlen = List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Position \n hinzufügen', 86),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(45, 60, 45, 20),
            child: AddBillInputField(
              'Name',
              nameController,
            ),
          ),
          SelectGroupDropDown(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(45, 30, 5, 20),
                child: Container(
                  width: 255,
                  alignment: Alignment.centerLeft,
                  child: AddBillInputField(
                    'Preis',
                    preisController,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 30, 20, 20),
                child: Container(
                  width: 75,
                  alignment: Alignment.centerRight,
                  child: AddBillInputField(
                    'Anzahl',
                    anzahlController,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: HinzufuegenButton(() {
              namen.add(nameController.text);
              preise.add(preisController.text);
              anzahlen.add(anzahlController.text);

              Route route = MaterialPageRoute(
                builder: (context) => ShowAddedPositions(namen),
              );
              Navigator.push(context, route);
            }),
          ),
        ],
      ),
    );
  }
}
