import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:learn_bloc/data/cart_items.dart';
import 'package:learn_bloc/models/models.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
   on<CartSuccessEvent>(cartSuccessEvent);
   on<CartDeleteEvent>(cartDeleteEvent);
  
  }

  FutureOr<void> cartSuccessEvent(CartSuccessEvent event, Emitter<CartState> emit) {

    emit(CartSuccessState(cartlist:cartlist));
  }

   FutureOr<void> cartDeleteEvent(CartDeleteEvent event, Emitter<CartState> emit) {

        cartlist.remove(event.product);
        emit(CartSuccessState(cartlist: cartlist));

  }
}
