import 'package:flutter/material.dart';

class AddBillInputField extends StatelessWidget {
  final String _textInputLabel;

  AddBillInputField(this._textInputLabel);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 0, 10),
          child: Text(
            _textInputLabel,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'SF Pro Text',
              color: Color.fromARGB(255, 65, 65, 65),
            ),
          ),
        ),
        TextField(
          style: TextStyle(fontFamily: 'SF Pro Text', fontSize: 15.0),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 224, 224, 224),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 29, 53, 87),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class HinzufuegenButton extends StatelessWidget {
  HinzufuegenButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
      child: SizedBox(
        width: 340,
        height: 50,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Hinzufügen',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Avenir Next',
                fontWeight: FontWeight.w500,
                fontSize: 18),
          ),
          color: const Color.fromARGB(255, 29, 53, 87),
        ),
      ),
    );
  }
}
