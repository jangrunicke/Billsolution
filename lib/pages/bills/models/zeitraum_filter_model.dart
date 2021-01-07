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
}

enum SelectedFilter {
  none,
  eineWoche,
  einMonat,
  jahr,
}
