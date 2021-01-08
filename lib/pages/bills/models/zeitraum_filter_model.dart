import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ZeitraumfilterModel with ChangeNotifier {
  SelectedFilter ausgewaehlt = SelectedFilter.none;

  void select(int index) {
    switch (index) {
      case 0:
        ausgewaehlt = SelectedFilter.none;
        notifyListeners();
        break;

      case 1:
        ausgewaehlt = SelectedFilter.eineWoche;
        notifyListeners();
        break;

      case 2:
        ausgewaehlt = SelectedFilter.einMonat;
        notifyListeners();
        break;

      case 3:
        ausgewaehlt = SelectedFilter.jahr;
        notifyListeners();
        break;
    }
  }

  DateTime getLastValidDate() {
    switch (ausgewaehlt) {
      case SelectedFilter.none:
        return DateTime(2005);
        break;

      case SelectedFilter.eineWoche:
        var now = DateTime.now();
        return now.subtract(Duration(days: 7));
        break;

      case SelectedFilter.einMonat:
        var now = DateTime.now();
        return now.subtract(Duration(days: 31));
        break;

      case SelectedFilter.jahr:
        var now = DateTime.now();
        return now.subtract(Duration(days: 365));
        break;
    }
  }
}

enum SelectedFilter {
  none,
  eineWoche,
  einMonat,
  jahr,
}
