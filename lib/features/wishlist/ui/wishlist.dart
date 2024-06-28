import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/data/wishlist_items.dart';
import 'package:learn_bloc/features/cart/ui/cart.dart';
import 'package:learn_bloc/features/home/bloc/home_bloc.dart';
import 'package:learn_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:learn_bloc/features/wishlist/ui/wishlist_tile.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {


  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wishlistBloc.add(WishlistSuccessEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      bloc: wishlistBloc,
      listenWhen: (previous, current) => current is WishlistActionState,
      buildWhen: (previous, current) => current is !WishlistActionState,
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
          

          case WishlistSuccessState:
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Wishlist'),
                  backgroundColor: Colors.teal,
                  
                ),
                body: ListView.builder(
                    itemCount: wishlist.length,
                    itemBuilder: (context, index) {
                      return WishlistTileWidget(productDataModel: wishlist[index], wishlistBloc: wishlistBloc);
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
