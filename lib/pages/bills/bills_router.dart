import 'package:billsolution_app/pages/bills/bills_home.dart';
import 'package:flutter/material.dart';

/// Dieses Widget übernimmt das Routing für den Billsbereich
class BillsRouter extends StatelessWidget {
  /// Path-Um zu Bills-Home zugelangen
  static const homePath = '/';

  /// Funktion generiert die Route zum Bills-Home-Screen
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => BillsHome());
    }
  }

  /// Build-Funktion um Widget zu bauen
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoutes,
    );
  }
}
