import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/data/cart_items.dart';
import 'package:learn_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:learn_bloc/features/cart/ui/cart_tile.dart';
import 'package:learn_bloc/features/home/bloc/home_bloc.dart';
import 'package:learn_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:learn_bloc/features/wishlist/ui/wishlist.dart';


class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartBloc.add(CartSuccessEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listenWhen: (previous, current) => current is CartActionState,
      buildWhen: (previous, current) => current is !CartActionState,
      listener: (context, state) {
        if (state is HomeNavigateCartState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavigateWishlistState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          

          case CartSuccessState:
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Cart'),
                  backgroundColor: Colors.teal,
                  
                ),
                body: ListView.builder(
                    itemCount: cartlist.length,
                    itemBuilder: (context, index) {
                      return CartTile(productDataModel: cartlist[index], cartBloc: cartBloc);
                    }));
                    
          case WishlistErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
