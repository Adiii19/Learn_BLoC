part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductWishlistClickedButtonEvent extends HomeEvent{
    final ProductDataModel product;
  HomeProductWishlistClickedButtonEvent({required this.product});
}

class HomeProductCartClickedButtonEvent extends HomeEvent{
  final ProductDataModel product;
  HomeProductCartClickedButtonEvent({required this.product});
  
}

class HomeCartButtonNavigateEvent extends HomeEvent{}

class HomeWishlistButtonNavigateEvent extends HomeEvent{}


