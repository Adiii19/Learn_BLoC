import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/wishlist_items.dart';
import 'package:learn_bloc/models/models.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
   on<WishlistSuccessEvent>(wishlistSuccessEvent);
   on<WishlistDeleteEvent>(wishlistDeleteEvent);
  }
 
  FutureOr<void> wishlistSuccessEvent(WishlistSuccessEvent event, Emitter<WishlistState> emit) {
    
      emit(WishlistSuccessState(wishlist: wishlist));

  }

  FutureOr<void> wishlistDeleteEvent(WishlistDeleteEvent event, Emitter<WishlistState> emit) {

        wishlist.remove(event.product);
        emit(WishlistSuccessState(wishlist: wishlist));

  }
}


