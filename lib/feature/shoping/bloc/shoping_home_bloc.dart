import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/feature/shoping/data/cart_products.dart';
import 'package:bloc_counter_app/feature/shoping/data/products_data.dart';
import 'package:flutter/cupertino.dart';

import 'package:meta/meta.dart';

import '../data/data_model/product_data_model.dart';

part 'shoping_home_event.dart';

part 'shoping_home_state.dart';

class ShopingHomeBloc extends Bloc<ShopingHomeEvent, ShopingHomeState> {
  ShopingHomeBloc() : super(ShopingHomeInitial()) {
    on<ShoppingHomeInitialLoadEvent>(shoppingHomeInitialLoadEvent);
    on<ShoppingHomeAddProductToCartEvent>(shoppingHomeAddProductToCartEvent);
    on<ShoppingHomeToCartEvent>(shoppingHomeToCartEvent);
    on<ShoppingRemoveFromCart>(shoppingRemoveFromCart);
    on<ShoppingBackToHomeEvent>(shoppingBackToHomeEvent);
  }

  FutureOr<void> shoppingHomeInitialLoadEvent(
      ShoppingHomeInitialLoadEvent event, Emitter<ShopingHomeState> emit) {
    List<ProductDataModel> productsList =
        products.productsMap.map((e) => ProductDataModel.fromMap(e)).toList();
    emit(ShoppingHomeInitialLoadState(productList: productsList));
  }

  FutureOr<void> shoppingHomeAddProductToCartEvent(
      ShoppingHomeAddProductToCartEvent event, Emitter<ShopingHomeState> emit) {
    List<ProductDataModel> productsList =
        products.productsMap.map((e) => ProductDataModel.fromMap(e)).toList();
    CartProducts.cartProducts.add(productsList[event.index]);
    emit(ShoppingProductAddedToCart());
  }

  FutureOr<void> shoppingHomeToCartEvent(
      ShoppingHomeToCartEvent event, Emitter<ShopingHomeState> emit) {
    emit(ShoppingHomeToCartState());
  }

  FutureOr<void> shoppingRemoveFromCart(
      ShoppingRemoveFromCart event, Emitter<ShopingHomeState> emit) {
    CartProducts.cartProducts.removeAt(event.index);
    emit(ShoppingHomeRemoveFromCartState());
  }

  FutureOr<void> shoppingBackToHomeEvent(
      ShoppingBackToHomeEvent event, Emitter<ShopingHomeState> emit) {
    emit(ShoppingBackToHomeState());
  }
}
