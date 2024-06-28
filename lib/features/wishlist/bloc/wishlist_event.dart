part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistSuccessEvent extends WishlistEvent{}

class WishlistDeleteEvent extends WishlistEvent{
  final ProductDataModel product;
  WishlistDeleteEvent(this.product);
}


