part of 'shoping_home_bloc.dart';

@immutable
sealed class ShopingHomeState {}

final class ShopingHomeInitial extends ShopingHomeState {}

class ShoppingHomeInitialLoadState extends ShopingHomeState {
  final List<ProductDataModel> productList;

  ShoppingHomeInitialLoadState({required this.productList});
}

class ShoppingHomeRemoveFromCartState extends ShopingHomeState {}

abstract class ShoppingActionState extends ShopingHomeState {}

class ShoppingProductAddedToCart extends ShoppingActionState {}

class ShoppingHomeToCartState extends ShoppingActionState {}

class ShoppingBackToHomeState extends ShoppingActionState {}
