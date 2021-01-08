import 'dart:async';

import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../user_model.dart';

class AnalyticsHome extends StatelessWidget {
  String aggreagtion(Stream<List<Bill>> stream, String category) {
    String test = stream.first.toString();

    final subscrition = stream.listen((event) {
      test = event.first.id;
    });
    return test;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Auswertung',
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
              ),
              onPressed: () {
                return null;
              }),
        ],
      ),
      body: Center(
        child: Container(
          child: Consumer<UserModel>(builder: (context, user, child) {
            return StreamBuilder(
              stream: user.user,
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return Text(aggreagtion(snapshot.data.getBills(), 'hallo'));
                } else {
                  return Text('Empty');
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
