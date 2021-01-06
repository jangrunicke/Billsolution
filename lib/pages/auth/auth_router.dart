import 'package:billsolution_app/pages/auth/auth_home.dart';
import 'package:billsolution_app/pages/auth/registry/registry_page.dart';
import 'package:flutter/material.dart';

import 'forgot_password/forgot_password_page.dart';

class AuthRouter extends StatelessWidget {
  static const homePath = '/';
  static const registryPath = '/registry';
  static const forgotPasswordPath = '/forgotpassword';

  Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homePath:
        return MaterialPageRoute(builder: (context) => AuthHome());
      case registryPath:
        return MaterialPageRoute(builder: (context) => RegistryPage());
      case forgotPasswordPath:
        return MaterialPageRoute(builder: (context) => ForgotPasswordPage());
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
