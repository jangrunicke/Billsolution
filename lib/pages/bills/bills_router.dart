import 'package:billsolution_app/pages/bills/bills_home.dart';
import 'package:flutter/material.dart';

class BillsRouter extends StatelessWidget {
    static const homePath = '/';
  
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => BillsHome());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoutes,
    );
  }
}