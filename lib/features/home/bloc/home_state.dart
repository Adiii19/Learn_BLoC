part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState{}




final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState{
   final List<ProductDataModel> products;
   
   HomeLoadedState({required this.products});
}

class HomeErrorState extends HomeState{}

class HomeNavigateWishlistState extends HomeActionState{}

class HomeNavigateCartState extends HomeActionState{}

class HomeProductCartClickedButton extends HomeActionState{
 
}

class HomeProductWishlistClickedButton extends HomeActionState{

}


