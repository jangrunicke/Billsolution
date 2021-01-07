import 'package:flutter/material.dart';
import './widgets/add_bill_widgets.dart';
import './add_position_details.dart';

class AddBillPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Positionen', 56.0),
      body: Padding(
        padding: EdgeInsets.fromLTRB(35, 35, 35, 15),
        child: Container(
          width: 426,
          height: 48,
          child: RaisedButton(
            elevation: 0,
            color: Color.fromARGB(110, 224, 224, 224),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onPressed: () {
              Route route = MaterialPageRoute(
                  builder: (context) => AddBillPositionDetails());
              Navigator.push(context, route);
            },
            child: Icon(
              Icons.add,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
