import 'package:billsolution_app/pages/scan/scan_home.dart';
import 'package:flutter/material.dart';

class ScanRouter extends StatelessWidget {
  static const homePath = '/';
  
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => ScanHome());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoutes,
    );
  }
}