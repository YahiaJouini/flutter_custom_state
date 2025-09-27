import 'package:flutter/material.dart';
import 'package:flutter_custom_state/screens/login_screen.dart';
import 'package:flutter_custom_state/service_locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'State Management Demo', home: const Login());
  }
}
