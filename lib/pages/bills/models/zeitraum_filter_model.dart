import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ZeitraumfilterModel with ChangeNotifier {
  SelectedFilter _ausgewaehlt = SelectedFilter.none;

  void select(int index) {
    switch (index) {
      case 0:
        _ausgewaehlt = SelectedFilter.none;
        break;

      case 1:
        _ausgewaehlt = SelectedFilter.eineWoche;
        break;

      case 2:
        _ausgewaehlt = SelectedFilter.einMonat;
        break;

      case 3:
        _ausgewaehlt = SelectedFilter.dreiMonate;
        break;

      case 4:
        _ausgewaehlt = SelectedFilter.jahr;
    }
  }
}

enum SelectedFilter {
  none,
  eineWoche,
  einMonat,
  dreiMonate,
  jahr,
}
