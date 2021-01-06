import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/services/bill_service.dart';
import 'package:billsolution_app/services/user_service.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsHome extends StatelessWidget {
  Widget buildBillListTile(Bill bill) {
    return ListTile(
      title: Text(bill.shop.name),
      subtitle: Text(bill.created_at.toIso8601String()),
    );
  }

  Widget buildBillListView(List<Bill> bills) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return buildBillListTile(bills[index]);
      },
    );
  }

  List<Widget> buildList() {
    return [
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Test'),
      ),
      ListTile(
        title: Text('Test2'),
      ),
      Container(
        child: Consumer<UserModel>(builder: (context, user, child) {
          return StreamBuilder(
            stream: user.user,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                return Text(snapshot.data.id);
              } else {
                return Text('Empty');
              }
            },
          );
        }),
      ),
      Container(
        child: StreamBuilder(
          stream: BillService().find(),
          builder: (BuildContext context, AsyncSnapshot<List<Bill>> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return Text('Empty');
            }
            return Text(snapshot.data.first.shop.name);
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Einstellungen'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: buildList(),
            ),
          ),
          Expanded(
            child: 
              Container(
                child: Consumer<UserModel>(builder: (context, user, child) {
                  return StreamBuilder(
                    stream: user.user,
                    builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      if (!snapshot.hasData) {
                        return Text('Empty');
                      }
                      return StreamBuilder(
                        stream: snapshot.data.getBills(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Bill>> snapshot) {
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          if (!snapshot.hasData) {
                            return Text('Empty');
                          }
                          return buildBillListView(snapshot.data);
                        },
                      );
                    },
                  );
                }),
              ),
          ),
        ],
      ),
    );
  }
}
