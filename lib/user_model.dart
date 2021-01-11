import 'package:billsolution_app/aggregates/user.dart';
import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  // TODO: Deprecated
  Stream<User> _user;
  String _userId;

  set userId(String id) {
    _userId = id;
    notifyListeners();
  }

  String get userId => _userId;

  // TODO: Deprecated
  set user(Stream<User> user) {
    _user = user;
    notifyListeners();
  }

  // TODO: Deprecated
  Stream<User> get user => _user;

  bool get isLoggedIn => _userId != null && user != null;
}
