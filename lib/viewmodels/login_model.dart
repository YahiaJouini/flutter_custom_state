import 'package:flutter/foundation.dart';
import 'package:flutter_custom_state/services/auth_service.dart';

class LoginViewModel {
  final AuthService _authService;

  // each property is a separate ValueNotifier. widgets observing a specific notifier only rebuild when that particular value changes.
  // usually we would combine these under <Login> because they are used together but this is just  a demonstation
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isLoggedIn = ValueNotifier(false);
  final ValueNotifier<String?> error = ValueNotifier(null);

  LoginViewModel(this._authService);

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    error.value = null;
    try {
      await _authService.login(email, password);
      isLoggedIn.value = true;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
