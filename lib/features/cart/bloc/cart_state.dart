part of 'cart_bloc.dart';

@immutable
sealed class CartState {}
abstract class CartActionState{}

final class CartInitial extends CartState {}

final class CartSuccessState extends CartState{
  final List<ProductDataModel> cartlist;
  CartSuccessState({required this.cartlist});
}

class CartDelete extends CartState{
  final List<ProductDataModel> cartlist;
  CartDelete({required this.cartlist});
}