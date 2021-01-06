class AuthService {
  // Singelton
  static AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // TODO: Return user obejct with roles ...
  String login({String username, String password}) {
    // TODO: Login mechanism
    return 'hVPLNhZ4UBfJdPWkemK3';
  }
}
