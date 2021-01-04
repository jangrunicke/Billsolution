import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErstellterBeleg with ChangeNotifier {
  // int _id;
  String name;
  String einkaufsort;
  List<Belegposition> positionen;

  void createBill(name, einkaufsort) {
    var beleg = ErstellterBeleg();
    beleg.name = name;
    beleg.einkaufsort = einkaufsort;
    positionen = List<Belegposition>();

    print('Beleg wurde erstellt');
    print(beleg);

    notifyListeners();
  }

  void addPosition(name, kategorie, preis, anzahl) {
    var position = Belegposition(
        name: name, kategorie: kategorie, preis: preis, anzahl: anzahl);
    positionen.add(position);

    notifyListeners();
  }

  List<Belegposition> getPositions() {
    return positionen;
  }
}

class Belegposition {
  final String name;
  final Kategorie kategorie;
  final double preis;
  final int anzahl;

  Belegposition({this.name, this.kategorie, this.preis, this.anzahl});
}

enum Kategorie {
  lebensmittel,
  hygiene,
  elektronik,
  klamotten,
}
