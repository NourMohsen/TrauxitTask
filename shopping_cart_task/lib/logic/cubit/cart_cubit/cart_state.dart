part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}
class AddCartItem extends CartState {}
class RemoveCartItem extends CartState {}
