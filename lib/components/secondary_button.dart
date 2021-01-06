import 'package:flutter/material.dart';

import '../pages/auth/auth_theme.dart';

class SecondaryButton extends StatelessWidget {
  SecondaryButton({this.text, this.onPressed});

  final String text;
  final VoidCallback onPressed;
  final TextStyle style = AuthTheme().style;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).accentColor,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: onPressed,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Color(0xff414141)),
            )));
  }
}
