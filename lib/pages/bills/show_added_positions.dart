import 'package:flutter/material.dart';

import './widgets/add_bill_widgets.dart';

class ShowAddedPositions extends StatelessWidget {
  final List<String> _showNamen;
  // final List<String> _showAnzahlen;
  // final List<String> _showPreise;

  ShowAddedPositions(this._showNamen);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddBillPositionAppBar('Positionen', 56),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 600,
            child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: _showNamen.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 30,
                    child: Text('${_showNamen[index]}'),
                  );
                }),
          ),
          RaisedButton(onPressed: () {
            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }
}
