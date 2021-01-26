/*
  Eine Klasse, die das Dropdown für das Auswählen einer Händlerkategorie
  im Add_Bill Screen definiert
 */

import 'package:flutter/material.dart';

class SelectGroupDropDown extends StatefulWidget {
  _SelectGroupDropDownState createState() => _SelectGroupDropDownState();
  String currentValue;
  String dropdownLabel;

  SelectGroupDropDown(this.dropdownLabel);

  String getCurrentValue() {
    return currentValue;
  }
}

class _SelectGroupDropDownState extends State<SelectGroupDropDown> {
  var _kategorien = [
    'Lebensmittel',
    'Hygiene',
    'Elektronik',
    'Klamotten',
    'Freizeit',
    'Sonstiges'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(5, 15, 0, 5),
          child: Text(
            widget.dropdownLabel,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'SF Pro Text',
              color: Color.fromARGB(255, 65, 65, 65),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 7, 15),
          child: FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                  ),
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 16.0),
                  hintText: 'Bitte wähle eine Gruppe',
                ),
                isEmpty: widget.currentValue == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 1,
                    value: widget.currentValue,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(
                        () {
                          widget.currentValue = newValue;
                          state.didChange(newValue);
                          print(widget.currentValue);
                        },
                      );
                    },
                    items: _kategorien.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Avenir Next',
                            fontSize: 16,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
