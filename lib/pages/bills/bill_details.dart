import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/billposition/billposition.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BillDetails extends StatelessWidget {
  Bill _bill;

  BillDetails(this._bill);

  Widget _buildInfos(BuildContext context) {
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
                  'Total: ' + snapshot.data.toStringAsFixed(2) + ' €',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          _bill.shop.location.country +
                              ', ' +
                              _bill.shop.location.city +
                              ' ' +
                              _bill.shop.location.zip,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(_bill.shop.location.street,
                            style: TextStyle(color: Colors.white)),
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
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          _bill.shop.vendor.name,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(_bill.shop.vendor.category,
                            style: TextStyle(color: Colors.white)),
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
          color: Theme.of(context).primaryColor,
          // borderRadius: BorderRadius.circular(15),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 4, color: Colors.grey, offset: Offset(0, 4)),
          ]),
      // margin: EdgeInsets.all(15),
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
                  return Column(
                    children: [
                      Flexible(
                        child: ListView.separated(
                          padding: EdgeInsets.all(15),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                                title: Row(
                                  children: [
                                    Text(
                                      snapshot.data[index].productName,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Expanded(
                                      child: Text(
                                        'x' +
                                            snapshot.data[index].amount
                                                .toInt()
                                                .toString(),
                                        style: TextStyle(
                                            fontFamily: 'Roboto',
                                            fontSize: 18,
                                            color: Colors.grey),
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ],
                                ),
                                trailing: SizedBox(
                                  width: 100,
                                  child: Text(
                                    (snapshot.data[index].price * 1.19)
                                            .toStringAsFixed(2) +
                                        '€',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        color: Colors.grey),
                                    textAlign: TextAlign.end,
                                  ),
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                      Container(
                        child: StreamBuilder(
                            stream: _bill.getCalculatedSum(),
                            builder: (BuildContext context,
                                AsyncSnapshot<double> snapshot) {
                              if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Divider(
                                      color: Colors.black,
                                      thickness: 1.5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Total: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data.toStringAsFixed(2) +
                                              '€',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.end,
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                );
                              }
                              return Text('Waiting');
                            }),
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.all(15),
                      ),
                    ],
                  );
                } else {
                  return Text('Nichts');
                }
              },
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,

          // borderRadius: BorderRadius.only(
          //     topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                blurRadius: 4.0, color: Colors.grey, offset: Offset(0, 4.0))
          ]),
      margin: EdgeInsets.fromLTRB(15, 25, 15, 15),
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
          elevation: 0,
        ),
        body: Column(
          children: [_buildInfos(context), Expanded(child: _buildPositons())],
        ),
        backgroundColor: Color.fromRGBO(249, 249, 249, 1.0));
  }
}
