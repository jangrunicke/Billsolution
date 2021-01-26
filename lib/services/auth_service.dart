/// Authentifizierungs Service um sich anzumelden, später auch zum registrieren etc.
class AuthService {
  // Singelton
  static AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Mocking der login funktionalität
  // TODO: Return user obejct with roles ...
  String login({String username, String password}) {
    // TODO: Login mechanism
    return 'hVPLNhZ4UBfJdPWkemK3';
  }
}
