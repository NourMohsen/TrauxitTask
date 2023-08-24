import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart_task/logic/cubit/cart_cubit/cart_cubit.dart';
import 'package:shopping_cart_task/presentation/view/widgets/custom_button.dart';
import 'package:shopping_cart_task/presentation/view/widgets/custom_text_field.dart';

class ShoppingCartViewBody extends StatelessWidget {
  const ShoppingCartViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    String? id, name, price;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CustomTextField(
                      hint: "Add id (1 , 2 , 3 , ... , etc)",
                      onChanged: (value) {
                        id = value;
                      },
                    ),
                    CustomTextField(
                      hint: "Add Name (Carrot , Kiwi ,...,etc)",
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    CustomTextField(
                      hint: "Add Price ( 3, 8.5 , 12 ,...,etc )",
                      onChanged: (value) {
                        price = value;
                      },
                    ),
                    CustomButton(onPressed: () {
                      BlocProvider.of<CartCubit>(context).addItem(
                        id: int.parse(id.toString()),
                        name: name!,
                        price: double.parse(price.toString()),
                      );
                    }),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: BlocProvider.of<CartCubit>(context).items.length,
                  itemBuilder: (context, index) {
                    final item =
                        BlocProvider.of<CartCubit>(context).items[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle),
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context).removeItem(item);
                        },
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
