import 'package:billsolution_app/aggregates/user.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  Stream<User> _user;

  set user(Stream<User> user) {
    _user = user;
    notifyListeners();
  }

  Stream<User> get user => _user;

  bool get isLoggedIn => _user != null;
}
