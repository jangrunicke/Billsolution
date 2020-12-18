import 'package:billsolution_app/pages/settings/settings_home.dart';
import 'package:flutter/material.dart';

class SettingsRouter extends StatelessWidget {
    static const homePath = '/';
  
  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => SettingsHome());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoutes,
    );
  }
}