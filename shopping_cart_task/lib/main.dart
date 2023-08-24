import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_task/presentation/view/shopping_cart_view.dart';
import 'logic/cubit/cart_cubit/cart_cubit.dart';

void main() {
  runApp(const ShoppingCartApp());
}


class ShoppingCartApp extends StatelessWidget {
  const ShoppingCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping Cart App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CartCubit(),
        child: const ShoppingCartView(),
      ),
    );
  }
}