import 'package:billsolution_app/aggregates/user.dart';
import 'package:billsolution_app/repositorys/user_repository.dart';

class UserService {
  static UserService _instance;

  static UserService get instance {
    if (_instance == null) {
      _instance = UserService._internal();
    }
    return _instance;
  }

  UserService._internal();

  Stream<User> findById(String id) {
    return UserRepository().findById(id);
  }

  Stream<List<User>> find() {
    // TODO: CriteriaObject implementation
    return UserRepository().find();
  }
}
