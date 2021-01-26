import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/repositorys/user_repository.dart';

/// UserService um operation um das User Object zu handeln
class UserService {
  static UserService _instance;

  static UserService get instance {
    if (_instance == null) {
      _instance = UserService._internal();
    }
    return _instance;
  }

  UserService._internal();

  /// User anhand seine ID finden
  Stream<User> findById(String id) {
    return UserRepository().findById(id);
  }

  /// Alle User finden
  Stream<List<User>> find() {
    // TODO: CriteriaObject implementation
    return UserRepository().find();
  }
}
