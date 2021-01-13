import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/bill/location.dart';
import 'package:billsolution_app/aggregates/bill/shop.dart';
import 'package:billsolution_app/aggregates/bill/vendor.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/services/bill_service.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsHome extends StatelessWidget {
  Widget buildBillListTile(Bill bill) {
    return ListTile(
      title: Text(bill.shop.name),
      subtitle: StreamBuilder(
        stream: bill.getCalculatedSumOfCategory('Lebensmittel'),
        builder: (context, AsyncSnapshot<double> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          if (!snapshot.hasData) {
            return Text('Waiting');
          }
          if (snapshot.data == null) {
            return Text('Null');
          }
          return Text(snapshot.data.toString());
        },
      ),
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
            return StreamBuilder(
              stream: snapshot.data.first.getCalculatedSum(),
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (!snapshot.hasData) {
                  return Text('Empty');
                }
                return Text(snapshot.data.toString());
              },
            );
            return Text(snapshot.data.first.created_at.toString());
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
          Consumer<User>(builder: (context, user, child) {
            if (user != null) {
              return StreamBuilder(
                stream: user.calculatedSumOfVendor(
                    Vendor(category: 'Lebensmittel Discounter', name: 'Edeka'),
                    startingAt: DateTime.parse('2020-12-01 20:18:04Z')),
                builder: (context, AsyncSnapshot<double> snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (!snapshot.hasData) {
                    return Text('Empty');
                  }
                  return Text(snapshot.data.toString());
                },
              );
            } else
              return Text('Waiting');
          }),
          Expanded(
            child: Container(
              child: Consumer<User>(builder: (context, user, child) {
                if (user != null) {
                  return StreamBuilder(
                    stream: user.getBills(),
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
                } else
                  return Text('Waiting');
              }),
            ),
          ),
          Consumer<UserModel>(
            builder: (context, user, child) {
              return StreamBuilder(
                stream: user.user,
                builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                  return ElevatedButton(
                    child: Text('Add Bill'),
                    onPressed: () async {
                      try {
                        User latestUser = snapshot.data;
                        Bill bill = await latestUser.addBill(Bill(
                            shop: Shop(
                              location: Location(
                                street: 'Josef-Schofer-Straße 14',
                                city: 'Karlsruhe',
                                zip: '76187',
                                country: 'Deutschland',
                              ),
                              vendor: Vendor(
                                  name: 'Rewe',
                                  category: 'Lebensmittel Discounter'),
                              name: 'Rewe Lampert',
                            ),
                            groups: ['Bus ausbauen'],
                            created_at: DateTime.now(),
                            shopBillId: '002'));
                        print(bill.id);
                      } catch (error) {
                        print(error.toString());
                      }
                    },
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
