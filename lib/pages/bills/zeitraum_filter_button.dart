import 'package:flutter/material.dart';

class ZeitraumFilterButton extends StatefulWidget {
  @override
  _ZeitraumFilterButtonState createState() => _ZeitraumFilterButtonState();
}

class _ZeitraumFilterButtonState extends State<ZeitraumFilterButton> {
  void buttonFn() => {};
  bool _selected = true;
  final colors = [
    Color.fromRGBO(224, 224, 244, 1.0),
    Color.fromRGBO(29, 53, 87, 1.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('1 Woche'),
        onPressed: () => {},
      ),
      decoration: BoxDecoration(
          color: _selected ? colors[1] : colors[2],
          borderRadius: BorderRadius.circular(15)),
      constraints: BoxConstraints(maxHeight: 35, maxWidth: 110),
    );
  }
}
