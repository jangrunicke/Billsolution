import 'package:flutter/material.dart';

class ZeitraumFilterButton extends StatefulWidget {
  @override
  _ZeitraumFilterButtonState createState() => _ZeitraumFilterButtonState();
}

class _ZeitraumFilterButtonState extends State<ZeitraumFilterButton> {
  bool _selected = false;
  void auswaehlen() {
    print('Ausgewählt?: ' + _selected.toString());
    setState(() {
      _selected = true;
    });
    print('Button wurde ausgewählt');
    print('Ausgewählt?: ' + _selected.toString());
  }

  final colors = [
    Color.fromRGBO(224, 224, 244, 1.0),
    Color.fromRGBO(29, 53, 87, 1.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('1 Woche'),
        onPressed: () => {auswaehlen()},
      ),
      decoration: BoxDecoration(
          color: colors[0], borderRadius: BorderRadius.circular(15)),
      constraints: BoxConstraints(maxHeight: 35, maxWidth: 110),
    );
  }
}
