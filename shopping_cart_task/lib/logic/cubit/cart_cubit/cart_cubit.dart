import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart_item_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartItem>items=[
    CartItem(id: 1, name: "Carrot", price: 12.5),
    CartItem(id: 2, name: "Mango", price: 12.5),
    CartItem(id: 3, name: "kiwi", price: 12.5),
  ];
  List<CartItem> users = [];

  void addItem({required int id,required String name,required double price}) {
    final item = CartItem(
      id: id,
      name: name,
      price: double.parse(price.toString()),
    );
    items.add(item);
    emit(AddCartItem());
  }

  void removeItem(CartItem item) {
    items.remove(item);
    emit(RemoveCartItem());
  }
}
