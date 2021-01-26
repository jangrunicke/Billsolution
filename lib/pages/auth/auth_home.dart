import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/components/primary_button.dart';
import 'package:billsolution_app/components/secondary_button.dart';
import 'package:billsolution_app/pages/auth/widgets/auth_input_text_field.dart';
import 'package:billsolution_app/services/auth_service.dart';
import 'package:billsolution_app/services/user_service.dart';
import 'package:billsolution_app/user_model.dart';
import 'package:provider/provider.dart';

import 'auth_router.dart';
import 'login_forgot_password_text.dart';

import 'package:flutter/material.dart';

/*
  Eine Klasse die den Login Screen definiert, wennd er User die App startet

  Beim Klicken des Einloggen oder des Registrieren Buttons, wird eine User Instanz 
  erstellt (.login())
 */
class AuthHome extends StatelessWidget {
  onTappedLogin(BuildContext context) {
    String id = AuthService().login();
    Stream<User> user = UserService.instance.findById(id);
    Provider.of<UserModel>(context, listen: false).userId = id;
    Provider.of<UserModel>(context, listen: false).user = user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anmelden'),
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 200.00,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 55.0),
                AuthInputTextField(
                  hintText: 'E-Mail Adresse',
                  obscureText: false,
                ),
                SizedBox(height: 25.0),
                AuthInputTextField(
                  hintText: 'Passwort',
                  obscureText: true,
                ),
                SizedBox(height: 10.0),
                LoginForgotPasswordText(
                    onTap: () => Navigator.pushNamed(
                        context, AuthRouter.forgotPasswordPath)),
                SizedBox(height: 35.0),
                PrimaryButton(
                    text: 'Anmelden', onPressed: () => onTappedLogin(context)),
                SizedBox(height: 25.0),
                SecondaryButton(
                    text: 'Registrieren',
                    onPressed: () =>
                        Navigator.pushNamed(context, AuthRouter.registryPath))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
