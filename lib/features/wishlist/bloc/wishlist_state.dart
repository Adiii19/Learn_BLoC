part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}
abstract class WishlistActionState{}

final class WishlistInitial extends WishlistState {}


class WishlistSuccessState extends WishlistState{
  final List<ProductDataModel> wishlist;
  WishlistSuccessState({required this.wishlist});
}
class WishlistErrorState extends WishlistState{

}


class WishlistDelete extends WishlistState{
  final List<ProductDataModel> wishlist;
  WishlistDelete({required this.wishlist});
}