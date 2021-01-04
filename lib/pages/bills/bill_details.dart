import 'package:flutter/material.dart';

class BillDetails extends StatelessWidget {
  Widget buildGroup(String gruppenname) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [Text('Rewe Einkauf'), Text('27.12.2020')],
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Text(
                'Gruppe 1',
                style: TextStyle(
                    color: Color.fromRGBO(152, 152, 152, 1.0), fontSize: 18),
              ),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4.0,
                      offset: Offset(0.0, 4.0),
                      color: Colors.grey)
                ],
              ),
              constraints: BoxConstraints.expand(
                width: double.infinity,
                height: 500,
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return buildGroup('Gruppe 1');
    // return Scaffold(appBar: AppBar(title: Text('bla')), body: Container());
  }
}
