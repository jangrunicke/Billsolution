import 'package:flutter/material.dart';

class Zeitraumfilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ZeitraumFilterButton('1 Woche'),
          ZeitraumFilterButton('1 Monat'),
          ZeitraumFilterButton('3 Monate'),
          ZeitraumFilterButton('1 Jahr')
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
    );
  }
}

class ZeitraumFilterButton extends StatefulWidget {
  final String _buttonText;

  ZeitraumFilterButton(this._buttonText);

  @override
  _ZeitraumFilterButtonState createState() =>
      _ZeitraumFilterButtonState(this._buttonText);
}

class _ZeitraumFilterButtonState extends State<ZeitraumFilterButton> {
  _ZeitraumFilterButtonState(String buttonText) {
    _selected = false;
    this._buttonText = buttonText;
  }

  String _buttonText;

  bool _selected;
  void auswaehlen() {
    print('Ausgewählt?: ' + _selected.toString());
    setState(() {
      _selected = _selected ? false : true;
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
        child: Text(
          this._buttonText,
          style: TextStyle(color: _selected ? Colors.white : Colors.black),
        ),
        onPressed: () => {auswaehlen()},
      ),
      decoration: BoxDecoration(
          color: _selected ? colors[1] : colors[0],
          borderRadius: BorderRadius.circular(15)),
      constraints: BoxConstraints(maxHeight: 35, maxWidth: 110),
      margin: EdgeInsets.fromLTRB(3, 5, 3, 0),
    );
  }
}
