import 'package:billsolution_app/components/primary_button.dart';
import 'package:flutter/material.dart';

class AuthPopup extends StatelessWidget {
  final String text;
  final String title;

  AuthPopup({this.text, this.title});

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
            child: PrimaryButton(
                text: 'Ok',
                onPressed: () =>
                    Navigator.popUntil(context, ModalRoute.withName('/')))),
      ],
    );
  }
}
