import 'package:flutter/material.dart';
import 'package:login_screen_task/screens/login_page_view.dart';

void main() {
  runApp(const LoginScreenApp());
}

class LoginScreenApp extends StatelessWidget {
  const LoginScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Screen App",
      home: LoginPageView(),
    );
  }
}
