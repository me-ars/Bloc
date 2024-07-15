part of 'shoping_home_bloc.dart';

@immutable
sealed class ShopingHomeEvent {}

class ShoppingHomeInitialLoadEvent extends ShopingHomeEvent {}

class ShoppingHomeToCartEvent extends ShopingHomeEvent {}

class ShoppingHomeAddProductToCartEvent extends ShopingHomeEvent {
  final int index;

  ShoppingHomeAddProductToCartEvent(this.index);
}

class ShoppingRemoveFromCart extends ShopingHomeEvent {
  final int index;

  ShoppingRemoveFromCart(this.index);
}

class ShoppingBackToHomeEvent extends ShopingHomeEvent {}
