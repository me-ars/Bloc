import 'package:bloc_counter_app/feature/shoping/bloc/shoping_home_bloc.dart';
import 'package:bloc_counter_app/feature/shoping/widgets/productTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart/ui.dart';

class ShoppingHome extends StatefulWidget {
  const ShoppingHome({super.key});

  @override
  State<ShoppingHome> createState() => _ShoppingHomeState();
}

class _ShoppingHomeState extends State<ShoppingHome> {
  @override
  void initState() {
    super.initState();
    shoppingHomeBloc.add(ShoppingHomeInitialLoadEvent());
  }

  final shoppingHomeBloc = ShopingHomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopingHomeBloc, ShopingHomeState>(
      bloc: shoppingHomeBloc,
      listenWhen: (previous, current) => current is ShoppingActionState,
      buildWhen: (previous, current) => current is! ShoppingActionState,
      listener: (context, state) {
        if(state is ShoppingProductAddedToCart) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("added to cart")));
        }
        else if(state is ShoppingHomeToCartState){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Cart()));
        }
      },
      builder: (context, state) {
        if (state is ShoppingHomeInitialLoadState) {
          var item = state;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.purple,
                title: const Text("Zepto",
                style: TextStyle(color: Color(0xFFD70F4B)),),
                actions: [
                  IconButton(
                      onPressed: () {
                        shoppingHomeBloc.add(ShoppingHomeToCartEvent());
                      }, icon: const Icon(Icons.shopping_cart))
                ],
              ),
              body: ListView.builder(
                  itemCount: item.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      image: item.productList[index].image,
                      productName: item.productList[index].name,
                      productDescription: item.productList[index].description,
                      productPrice: item.productList[index].price.toString(),
                      addToCart: () {
                        shoppingHomeBloc.add(ShoppingHomeAddProductToCartEvent(index));
                      },
                      inCart: false,
                    );
                  }));
        } else {
          return const Scaffold(
            body: Center(
              child: Text("wow such empty"),
            ),
          );
        }
      },
    );
  }
}
