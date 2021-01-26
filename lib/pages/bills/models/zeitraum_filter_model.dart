import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Klasse, die den Status des aktuellen ausgewählten Zeitraumfilter bereitstellt.
/// Erweitert durch die Provider Bibliothek, wodurch von außen auf den Zustand zugegriffen werden kann
///   --> Observer-Patttern
class ZeitraumfilterModel with ChangeNotifier {
  /// Enum, das den aktuell ausgewählten Zeitfilter repräsentiert
  /// Default = none
  SelectedFilter ausgewaehlt = SelectedFilter.none;

  /// Methode um den aktuellen Zeitfilter auszuwählen / zu ändern
  /// notifyListeners, benachrichtigt Observer.
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

  /// Methode um den letzten Tag, der im gültigen Zeitraum liegt zu berechnnen,
  ///   unter der Berücksichtigung des aktuell ausgewählten Filters.
  /// returned: Letzes Datum im Zeitraum
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
