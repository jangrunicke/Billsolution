import 'dart:math';

import 'package:billsolution_app/pages/bills/models/vendor_filter_model.dart';
import 'package:billsolution_app/pages/bills/models/zeitraum_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/vendor_list.dart';
import 'widgets/zeitraum_filter.dart';
import 'add_bill.dart';
import './belege_liste.dart';

/// Widget, für den Bills-Home-Screen
class BillsHome extends StatelessWidget {
  /// build-Funktion, die den Inhalt des Widgets enthält
  /// Multi-Provider um auf die ausgewählten Filter durch Provider-Bibliothek zugreifen kann
  /// returned: Scaffold Widget um Standard Material-Design Bildschirm mit App-Bar zu erstellen
  /// Appbar beinhaltet den Knopf zum manuellen anlegen eines neuen Beleges
  /// Body beinhaltet das Zeitraumfilter-Model, die Händler-Karten-Liste und die Belege-Liste
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ZeitraumfilterModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => VendorFilterModel(),
        )
      ],
      child: Scaffold(
          backgroundColor: Color.fromRGBO(249, 249, 249, 1.0),
          appBar: AppBar(
            title: Text('Belege'),
            actions: [
              IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (context) => AddBill());
                    Navigator.push(context, route);
                  }),
            ],
          ),
          body: Column(
            children: [
              Zeitraumfilter(),
              VendorList(),
              BelegeListe(),
            ],
          )),
    );
  }
}
