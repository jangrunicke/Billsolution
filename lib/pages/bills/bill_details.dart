import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillDetails extends StatelessWidget {
  Bill _bill;

  BillDetails(this._bill);

  Widget _buildInfos() {
    return Container(
      child: StreamBuilder(
        stream: _bill.getCalculatedSum(),
        builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.hasData) {
            return Column(
              children: [
                Text(
                  'Total: ' + snapshot.data.toString() + ' €',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          _bill.shop.location.country +
                              ', ' +
                              _bill.shop.location.city +
                              ' ' +
                              _bill.shop.location.zip,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(_bill.shop.location.street,
                            style: TextStyle(color: Colors.grey)),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          _bill.shop.vendor.name,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(_bill.shop.vendor.category,
                            style: TextStyle(color: Colors.grey)),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            );
          }
          return Text('Waiting');
        },
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.grey, offset: Offset(0, 4)),
          ]),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.fromLTRB(25, 15, 20, 25),
      alignment: Alignment.topLeft,
    );
  }

  Widget _buildPositons() {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _bill.getBillpositions(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Billposition>> snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Row(
                          children: [
                            Expanded(
                                child: Text(snapshot.data[index].productName)),
                            Flexible(
                                child: Text(
                                    snapshot.data[index].amount.toString()))
                          ],
                        ),
                        trailing:
                            Text(snapshot.data[index].price.toString() + '€'),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                  );
                } else {
                  return Text('Nichts');
                }
              },
            ),
          ),
          Container(
            child: StreamBuilder(
                stream: _bill.getCalculatedSum(),
                builder:
                    (BuildContext context, AsyncSnapshot<double> snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  if (snapshot.hasData) {
                    return Text(
                      'Total: ' + snapshot.data.toString() + '€',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    );
                  }
                  return Text('Waiting');
                }),
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(15),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                blurRadius: 4.0, color: Colors.grey, offset: Offset(0, -4.0))
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');

    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(_bill.shop.name),
              Text(formatter.format(_bill.created_at))
            ],
          ),
        ),
        body: Column(
          children: [_buildInfos(), Expanded(child: _buildPositons())],
        ),
        backgroundColor: Color.fromRGBO(249, 249, 249, 1.0));
  }
}
