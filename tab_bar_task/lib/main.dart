import 'package:flutter/material.dart';
import 'package:tab_bar_task/tab_bar_screen.dart';

void main() {
  runApp(const TabBarApp());
}

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "TabBar App",
      debugShowCheckedModeBanner: false,
        home:  TabBarScreen());
  }
}
