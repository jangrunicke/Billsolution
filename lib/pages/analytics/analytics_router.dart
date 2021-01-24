import 'package:billsolution_app/pages/analytics/analytics_home.dart';
import 'package:flutter/material.dart';

class AnalyticsRouter extends StatelessWidget {
  static const homePath = '/';
  static const demoChart = '/chart';

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => AnalyticsHome());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoutes,
    );
  }
}
