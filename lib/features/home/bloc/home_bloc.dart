import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/cart_items.dart';
import 'package:learn_bloc/data/product_data.dart';
import 'package:learn_bloc/data/wishlist_items.dart';
import 'package:learn_bloc/features/wishlist/ui/wishlist.dart';
import 'package:learn_bloc/models/models.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
     on<HomeInitialEvent>(homeInitialEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
   
     on<HomeProductCartClickedButtonEvent>(homeProductCartClickedButtonEvent);
          on<HomeProductWishlistClickedButtonEvent>(homeProductWishlistClickedButtonEvent);

    //  on<HomeProductWishlistClickedButtonEvent>(homeProductWishlistClickedButtonEvent());
  }

   FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {

    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedState(
        products: GroceryItems.groceryItems
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                price: e['price'],
                imageUrl: e['imageUrl']))
            .toList()));
  }

  FutureOr<void> homeProductCartClickedButtonEvent(
      HomeProductCartClickedButtonEvent event, Emitter<HomeState> emit) {
      cartlist.add(event.product);
    emit(HomeProductCartClickedButton()
        
    );
  }

    FutureOr<void> homeProductWishlistClickedButtonEvent(
      HomeProductWishlistClickedButtonEvent event, Emitter<HomeState> emit) {
       wishlist.add(event.product);
    emit(HomeProductWishlistClickedButton());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateCartState());
  }

    FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateWishlistState());
  }

  // EventHandler<HomeProductCartClickedButtonEvent, HomeState> homeProductCartClickedButtonEvent() {
  //   return
  // }

  // EventHandler<HomeProductWishlistClickedButtonEvent, HomeState> homeProductWishlistClickedButtonEvent() {
  //   return
  // }

 
}
