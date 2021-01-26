import 'package:billsolution_app/pages/bills/models/zeitraum_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Zeitraumfilter-Widget, dass der Darstellung von Zeitraumfilter-Buttons dient
class Zeitraumfilter extends StatelessWidget {
  /// Build-Methode, die von der Flutter Engine aufgerufen wird,
  ///   wenn das Widget dargestellt werden soll.
  /// returned: Container-Widget, dass ein Row-Widget mit den einzelnen Buttons beinhaltet.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(child: ZeitraumFilterButton(1, '1 Woche')),
          Expanded(child: ZeitraumFilterButton(2, '1 Monat')),
          Expanded(child: ZeitraumFilterButton(3, '1 Jahr')),
        ],
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
    );
  }
}

/// Widget, dass zur Darstellung eines einzelnen Filter-Buttons dient.
class ZeitraumFilterButton extends StatefulWidget {
  /// Text, der auf dem Button stehen soll
  final String _buttonText;

  /// Index, dient der Durchnummerierung und zur integration mit dem FilterModel,
  ///   um den Status des ausgewählten Filters zentral zu speichern
  final int _index;

  /// Konstruktor
  /// Parameter _index, _buttonText
  ZeitraumFilterButton(
    this._index,
    this._buttonText,
  );

  /// von Flutter erstellte Methode um das Widget mit seinem State zu koppeln
  @override
  _ZeitraumFilterButtonState createState() =>
      _ZeitraumFilterButtonState(this._buttonText, this._index);
}

/// Beinhaltet den aktuellen State des Buttons
class _ZeitraumFilterButtonState extends State<ZeitraumFilterButton> {
  /// Konstruktor
  _ZeitraumFilterButtonState(String buttonText, int index) {
    this._buttonText = buttonText;
    this._index = index;
  }

  /// Text, der auf dem Button stehen soll
  String _buttonText;

  /// Index (Nummerierung der einzelnen Butttons), des Buttons
  int _index;

  /// Methode, die aufgerufen wird, wenn auf den Button geclicktt wird.
  /// Setzt im FilterModel den aktuell ausgewählten Button
  void auswaehlen() {
    print('Button ${_index} wurde gedrückt');
    var filterModel = context.read<ZeitraumfilterModel>();
    print(filterModel.ausgewaehlt);
    filterModel.ausgewaehlt.index == _index
        ? filterModel.select(0)
        : filterModel.select(_index);
    print(filterModel.ausgewaehlt);
  }

  /// Farben, die die Buttons haben könne, je nach dem, ob sie ausgewählt sind.
  final colors = [
    Color.fromRGBO(224, 224, 244, 1.0),
    Color.fromRGBO(29, 53, 87, 1.0),
  ];

  /// Build-Mehtode, die von der Flutter Engine aufgerufen wird, wenn das Widget dargestellt werden soll
  /// returned einen Button mit Bezug auf das FilterModel(welcher Button aktuell ausgewählt ist).
  @override
  Widget build(BuildContext context) {
    return Consumer<ZeitraumfilterModel>(
        builder: (context, zeitraumfilter, child) => Container(
              child: FlatButton(
                child: Text(
                  this._buttonText,
                  style: TextStyle(
                      color: zeitraumfilter.ausgewaehlt.index == _index
                          ? Colors.white
                          : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                onPressed: () => {auswaehlen()},
              ),
              decoration: BoxDecoration(
                color: zeitraumfilter.ausgewaehlt.index == _index
                    ? colors[1]
                    : Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  zeitraumfilter.ausgewaehlt.index == _index
                      ? BoxShadow()
                      : BoxShadow(
                          blurRadius: 4.0,
                          offset: Offset(0.0, 4.0),
                          color: Colors.grey)
                ],
              ),

              // constraints: BoxConstraints(maxHeight: 35, maxWidth: 110),
              constraints: BoxConstraints(
                maxHeight: 35,
              ),

              margin: EdgeInsets.fromLTRB(3, 5, 3, 0),
            ));
  }
}
