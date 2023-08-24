import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'logic/provider/counter_provider.dart';
import 'presentation/view/counter_view.dart';

void main() {
  runApp(const CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Counter App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home:const CounterView(),
      ),
    );
  }
}