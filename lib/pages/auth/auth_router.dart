import 'package:billsolution_app/pages/auth/auth_home.dart';
import 'package:flutter/material.dart';

class AuthRouter extends StatelessWidget {
  static const homePath = '/';

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => AuthHome());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: generateRoutes,
    );
  }
}
