import 'package:bloc_counter_app/feature/shoping/bloc/shoping_home_bloc.dart';
import 'package:bloc_counter_app/feature/shoping/data/cart_products.dart';
import 'package:bloc_counter_app/feature/shoping/widgets/productTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final shoppingHomeBloc = ShopingHomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopingHomeBloc, ShopingHomeState>(
      bloc: shoppingHomeBloc,
      listenWhen: (prev, cur) => cur is ShoppingActionState,
      listener: (context, state) {
        if (state is ShoppingBackToHomeState) {
          Navigator.of(context).pop();
        }
      },
      buildWhen: (prev, cur) => cur is! ShoppingActionState,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    shoppingHomeBloc.add(ShoppingBackToHomeEvent());
                  },
                  icon: const Icon(Icons.chevron_left)),
            ),
            body: ListView.builder(
                itemCount: CartProducts.cartProducts.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                      image: CartProducts.cartProducts[index].image,
                      productName: CartProducts.cartProducts[index].name,
                      productDescription:
                          CartProducts.cartProducts[index].description,
                      productPrice:
                          CartProducts.cartProducts[index].price.toString(),
                      addToCart: () {
                        shoppingHomeBloc.add(ShoppingRemoveFromCart(index));
                      });
                }));
      },
    );
  }
}
