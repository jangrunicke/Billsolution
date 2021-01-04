import 'package:flutter/material.dart';

class SelectGroupDropDown extends StatefulWidget {
  _SelectGroupDropDownState createState() => _SelectGroupDropDownState();
}

class _SelectGroupDropDownState extends State<SelectGroupDropDown> {
  var _gruppen = [
    'Lebensmittel',
    'Hygiene',
    'Elektronik',
    'Klamotten',
  ];

  String _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(45, 30, 0, 5),
          child: Text(
            'Gruppe',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Avenir Next',
              color: Color.fromARGB(255, 65, 65, 65),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(45, 5, 45, 20),
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
                isEmpty: _currentSelectedValue == '',
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    elevation: 1,
                    value: _currentSelectedValue,
                    isDense: true,
                    onChanged: (String newValue) {
                      setState(
                        () {
                          _currentSelectedValue = newValue;
                          state.didChange(newValue);
                        },
                      );
                    },
                    items: _gruppen.map((String value) {
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
