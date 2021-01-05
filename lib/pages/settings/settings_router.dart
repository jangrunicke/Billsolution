import 'package:billsolution_app/pages/settings/settings_home.dart';
import 'package:billsolution_app/pages/settings/settings_profile.dart';
import 'package:flutter/material.dart';

class SettingsRouter extends StatelessWidget {
  static const homePath = '/';
  static const profilePath = '/profile';

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => SettingsHome());
      case profilePath:
        return MaterialPageRoute(builder: (context) => SettingsProfile());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoutes,
    );
  }
}
