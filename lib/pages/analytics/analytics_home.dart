import 'dart:async';

import 'package:billsolution_app/pages/analytics/mock/billposition_class.dart';
import 'package:billsolution_app/pages/analytics/mock/billposition_stream.dart';
import 'package:flutter/material.dart';

class AnalyticsHome extends StatelessWidget {
  Stream stream = new BillpositionStream().getStream();

  List<Widget> buildList() {
    return [
      Container(
        child: StreamBuilder(
          stream: stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            if (snapshot.hasData) {
              return Text(snapshot.data.name);
            } else {
              return Text('Empty');
            }
          },
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color.fromARGB(240, 249, 249, 249),
        title: Text(
          'Auswertung',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontFamily: 'Avenir Next',
          ),
          textAlign: TextAlign.center,
        ),
        toolbarHeight: 69.0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Color.fromARGB(255, 29, 53, 87),
              ),
              onPressed: () {
                return null;
              }),
        ],
      ),
      body: Container(
        child: Center(
          child: ListView(children: buildList()),
        ),
      ),
    );
  }
}
