import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class VendorFilterModel with ChangeNotifier {
  String selectedFilter = '';

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
