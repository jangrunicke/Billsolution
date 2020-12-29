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
        title: Text("Test"),
        trailing: Icon(
          Icons.favorite,
          color: Colors.red,
        ),
        onTap: () {
          setState(() {
            return null;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: _buildBelege());
  }
}
