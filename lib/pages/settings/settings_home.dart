import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      Container(child: Consumer<UserModel>(builder: (context, user, child) {
        return StreamBuilder(
          stream: user.user,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            if (snapshot.hasData) {
              return Text(snapshot.data.firstName);
            } else {
              return Text('Empty');
            }
          },
        );
      }))
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
