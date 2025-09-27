import 'package:flutter/material.dart';
import 'package:flutter_custom_state/screens/login_screen.dart';
import 'package:flutter_custom_state/service_locator.dart';
import 'package:flutter_custom_state/services/auth_service.dart';

class MyHomeScreen extends StatelessWidget {
  final AuthService _authService = serviceLocator<AuthService>();
  MyHomeScreen({super.key});

  void _navigateToLogin(BuildContext context) {
    _authService.logout();
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    String? token = _authService.token;
    if (token == null) {
      _navigateToLogin(context);
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Colors.green,
            ),
            const SizedBox(height: 10),
            const Text("Login Successful", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 25),
            Text("Token: $token", textAlign: TextAlign.center),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                _navigateToLogin(context);
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
