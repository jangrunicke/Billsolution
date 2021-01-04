import 'package:billsolution_app/pages/bills/bill_details.dart';
import 'package:flutter/material.dart';

class BelegeListe extends StatefulWidget {
  @override
  _BelegeListeState createState() => _BelegeListeState();
}

class _BelegeListeState extends State<BelegeListe> {
  Widget _buildBelege() {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          return _buildRow();
        });
  }

  Widget _buildRow() {
    return ListTile(
        title: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text("Händler",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("27.12.2020",
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

  @override
  Widget build(BuildContext context) {
    return Expanded(child: _buildBelege());
  }
}
