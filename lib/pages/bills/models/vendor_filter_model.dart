import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Klasse dient dem festhalten des aktuell ausgewählten Händlers (Händler-Card).
/// Erweitert durch die Provider-Bibliothek, kann so von außerhalb auf den aktuellen Status zugegriffen werden.
class VendorFilterModel with ChangeNotifier {
  /// Der Name des ausgewählten Händlers
  /// Default leerer String --> keiner ausgewählt
  String selectedFilter = '';

  /// Methode um den Status des ausgewählten Filters zu ändern
  /// Parameter vendorName: Der HändlerName, des ausgewählten Buttons
  /// notifyListeners() benachrichtigt alle Observer
  void selectFilter(String vendorName) {
    if (selectedFilter == vendorName) {
      selectedFilter = '';
      notifyListeners();
    } else {
      selectedFilter = vendorName;
      notifyListeners();
    }
  }
}
