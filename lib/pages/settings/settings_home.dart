import 'package:billsolution_app/aggregates/customer.dart';
import 'package:billsolution_app/services/customer_service.dart';
import 'package:flutter/material.dart';

class SettingsHome extends StatelessWidget {
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
        child: StreamBuilder(
          stream: CustomerService.instance.findById('t6II8iRuTQHQTJrLlphh'),
          builder:
              (BuildContext context, AsyncSnapshot<Customer> snapshot) {
            
            if (snapshot.hasError) {
              return Text('Error');
            }
            if (snapshot.hasData) {
              return Text(snapshot.data.birthdate.toString());
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
        title: Text('Einstellungen'),
      ),
      body: Container(
        child: Center(
          child: (ListView(
            children: buildList(),
          )),
        ),
      ),
    );
  }
}
