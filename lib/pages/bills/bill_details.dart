import 'package:flutter/material.dart';

class BillDetails extends StatelessWidget {
  var mockData = [
    {'name': 'Weihnstephan Milch', 'anzahl': 10, 'preis': 20.87},
    {'name': 'Bergbauernmilch', 'anzahl': 10, 'preis': 13.99},
    {'name': 'Chiqita Banane', 'anzahl': 3, 'preis': 2.99},
    {'name': 'Zahnpasta', 'anzahl': 1, 'preis': 3.29},
  ];

  Widget buildGroup(String gruppenname) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [Text('Rewe Einkauf'), Text('27.12.2020')],
          ),
        ),
        body: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Text(
                    'Gruppe 1',
                    style: TextStyle(
                        color: Color.fromRGBO(152, 152, 152, 1.0),
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 400,
                    child: _buildBeleg(),
                  )
                ],
              ),
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4.0,
                      offset: Offset(0.0, 4.0),
                      color: Colors.grey)
                ],
              ),
              constraints: BoxConstraints.expand(
                width: double.infinity,
                height: 500,
              ),
            ),
          ],
        ));
  }

  Widget _buildBeleg() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: mockData.length,
        itemBuilder: (context, i) {
          return _buildPosition(i);
        });
  }

  Widget _buildPosition(int index) {
    return ListTile(
      title: Expanded(child: Text(mockData[index]['name'])),
      trailing: Text(mockData[index]['preis'].toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildGroup('Gruppe 1');
    // return Scaffold(appBar: AppBar(title: Text('bla')), body: Container());
  }
}
