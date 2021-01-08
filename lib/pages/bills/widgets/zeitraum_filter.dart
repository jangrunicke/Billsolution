import 'package:billsolution_app/pages/bills/models/zeitraum_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Zeitraumfilter extends StatelessWidget {
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

class ZeitraumFilterButton extends StatefulWidget {
  final String _buttonText;
  final int _index;

  ZeitraumFilterButton(
    this._index,
    this._buttonText,
  );

  @override
  _ZeitraumFilterButtonState createState() =>
      _ZeitraumFilterButtonState(this._buttonText, this._index);
}

class _ZeitraumFilterButtonState extends State<ZeitraumFilterButton> {
  _ZeitraumFilterButtonState(String buttonText, int index) {
    this._buttonText = buttonText;
    this._index = index;
  }

  String _buttonText;
  int _index;

  void auswaehlen() {
    print('Button ${_index} wurde gedrückt');
    var filterModel = context.read<ZeitraumfilterModel>();
    print(filterModel.ausgewaehlt);
    filterModel.ausgewaehlt.index == _index
        ? filterModel.select(0)
        : filterModel.select(_index);
    print(filterModel.ausgewaehlt);
  }

  final colors = [
    Color.fromRGBO(224, 224, 244, 1.0),
    Color.fromRGBO(29, 53, 87, 1.0),
  ];

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
