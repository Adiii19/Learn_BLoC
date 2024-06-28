part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartSuccessEvent extends CartEvent{}

class CartDeleteEvent extends CartEvent{
  final ProductDataModel product;
  CartDeleteEvent(this.product);
}