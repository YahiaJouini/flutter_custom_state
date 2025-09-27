import 'package:flutter/material.dart';
import 'package:flutter_custom_state/screens/home_screen.dart';
import 'package:flutter_custom_state/service_locator.dart';
import 'package:flutter_custom_state/viewmodels/login_model.dart';
import 'package:flutter_custom_state/widgets/my_button.dart';
import 'package:flutter_custom_state/widgets/my_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final LoginViewModel vm = serviceLocator<LoginViewModel>();

  void login() {
    // mock backend login
    vm.login(email.text, password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder<String?>(
          valueListenable: vm.error,
          builder: (context, errorText, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_open_rounded, size: 100),
                const SizedBox(height: 10),
                Text(
                  "State management Example",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: email,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: password,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                if (errorText != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      errorText,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                ValueListenableBuilder<bool>(
                  valueListenable: vm.isLoading,
                  builder: (context, isLoading, child) {
                    return MyButton(
                      text: isLoading ? "Loading..." : "Sign In",
                      onTap: isLoading ? null : login,
                    );
                  },
                ),

                ValueListenableBuilder<bool>(
                  valueListenable: vm.isLoggedIn,
                  builder: (_, loggedIn, __) {
                    if (loggedIn) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => MyHomeScreen()),
                        );
                      });
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
