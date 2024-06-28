import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/features/cart/ui/cart.dart';
import 'package:learn_bloc/features/home/bloc/home_bloc.dart';
import 'package:learn_bloc/features/home/bloc/ui/product_tile.dart';
import 'package:learn_bloc/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    homeBloc.add(HomeInitialEvent());
    super.initState();
    
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
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
          case HomeLoadingState:
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );

          case HomeLoadedState:
            final successstate = state as HomeLoadedState;
            return Scaffold(
                appBar: AppBar(
                  title: const Text('The Grocery App'),
                  backgroundColor: Colors.teal,
                  actions: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border_rounded),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: Icon(Icons.shopping_cart_rounded),
                      color: Colors.black,
                    )
                  ],
                ),
                body: ListView.builder(
                    itemCount: successstate.products.length,
                    itemBuilder: (context, index) {
                      return ProductTileWidget(
                        productDataModel: successstate.products[index],
                        homeBloc: homeBloc,
                      );
                    }));
          case HomeErrorState:
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
