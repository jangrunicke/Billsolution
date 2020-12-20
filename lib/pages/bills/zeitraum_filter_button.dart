import 'package:flutter/material.dart';

class ZeitraumFilterButton extends StatelessWidget {
  void buttonFn() => {};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text('1 Woche'),
        onPressed: () => {},
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(224, 224, 244, 1.0),
          borderRadius: BorderRadius.circular(15)),
      constraints: BoxConstraints(maxHeight: 35, maxWidth: 110),
    );
  }
}
