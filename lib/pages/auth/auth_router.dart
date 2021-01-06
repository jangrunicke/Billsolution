import 'package:billsolution_app/pages/auth/auth_home.dart';
import 'package:billsolution_app/pages/auth/registry/registry_page.dart';
import 'package:flutter/material.dart';

class AuthRouter extends StatelessWidget {
  static const homePath = '/';
  static const registryPath = '/registry';

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => AuthHome());
      case registryPath:
        return MaterialPageRoute(builder: (context) => RegistryPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoutes,
      initialRoute: homePath,
    );
  }
}
