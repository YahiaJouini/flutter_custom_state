class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => "AuthException: $message";
}

class AuthService {
  String? _token;
  String? get token => _token;

  Future<void> login(String username, String password) async {
    await Future.delayed(Duration(seconds: 1));
    if (username == "admin" && password == "admin") {
      _token = "my secret token";
      // login successful
      return;
    }
    // login failed
    throw AuthException("Invalid username or password");
  }

  void logout() {
    // mock remove of persistant state
    _token = null;
  }
}
