/*
    Eine Klasse um wiederverwendbare Widgets im Zusammenhang mit dem Hinzufügen
    eines Belegs zu definieren
 */
import 'package:flutter/material.dart';

/*
 Wiederverwendbare InputFelder mit anpassbarem Label über den Textfeldern und 
 anpassbarem Hinweistext
*/
class AddBillInputField extends StatelessWidget {
  final String _textInputLabel;
  final TextEditingController _textEditingController;
  final String hintText;

  AddBillInputField(this._textInputLabel, this._textEditingController,
      {this.hintText});

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 0, 10),
          child: Text(
            _textInputLabel,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'SF Pro Text',
              color: Color.fromARGB(255, 65, 65, 65),
            ),
          ),
        ),
        Container(
          width: 380,
          child: TextField(
            controller: _textEditingController,
            style: TextStyle(fontFamily: 'SF Pro Text', fontSize: 15.0),
            decoration: InputDecoration(
              hintText: hintText,
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
        ),
      ],
    );
  }
}

/* 
  Button zum Hinzufügen
  Wiederverwendbarer Button, beim das Design gleichbleibt,
  die Funktion und das Label allerdings angepasst werden können
*/
class HinzufuegenButton extends StatelessWidget {
  final VoidCallback onPressed;
  final label;

  HinzufuegenButton({@required this.onPressed, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: SizedBox(
        width: //340,
            426,
        height: 50,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: onPressed,
          child: Text(
            this.label,
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

/*
  Wiederverwendbare AppBar mit dem gleichen Design, aber mit anpassbarem Titel
  und anpassbarer Höhe
 */
class AddBillPositionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String _titel;
  final double _height;

  AddBillPositionAppBar(this._titel, this._height);

  @override
  Size get preferredSize => new Size.fromHeight(_height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 120,
      elevation: 1,
      backgroundColor: Color.fromARGB(255, 29, 53, 87),
      title: Text(
        this._titel,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Avenir Next',
        ),
        textAlign: TextAlign.center,
      ),
      toolbarHeight: 85.0,
      leading: FlatButton.icon(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_outlined,
          color: Colors.white,
          size: 20,
        ),
        label: Text(
          'zurück',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Inter',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
