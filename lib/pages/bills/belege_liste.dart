import 'package:billsolution_app/aggregates/bill/bill.dart';
import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/pages/bills/bill_details.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelegeListe extends StatelessWidget {
  Widget _buildBelege(BuildContext context) {
    return Container(
      child: Consumer<UserModel>(builder: (context, user, child) {
        return StreamBuilder(
          stream: user.user,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (!snapshot.hasData) {
              return Text('User ist leer');
            }
            return StreamBuilder(
                stream: snapshot.data.getBills(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Bill>> snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  // if (!snapshot.hasData) {
                  //   return Text('Empty');
                  // }
                  return _buildBillListView(snapshot.data, context);
                });
          },
        );
      }),
    );
  }

  Widget _buildBillListView(List<Bill> bills, BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(10),
      itemCount: bills.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildBillListTile(bills[index], context);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget _buildBillListTile(Bill bill, BuildContext context) {
    return ListTile(
        title: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(bill.shop.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(_toDateFormat(bill.created_at),
                    style: TextStyle(color: Color.fromRGBO(152, 152, 152, 1.0)))
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )),
            Text(
              "28,76€",
              style: TextStyle(
                  color: Color.fromRGBO(152, 152, 152, 1.0), fontSize: 18),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color.fromRGBO(152, 152, 152, 1.0),
        ),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (BuildContext context) {
            return BillDetails();
          }));
        });
  }

  String _toDateFormat(DateTime date) {
    var result = date.day.toString() +
        '.' +
        date.month.toString() +
        '.' +
        date.year.toString();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: _buildBelege(context));
  }
}
