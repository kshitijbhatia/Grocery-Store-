import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_store/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:grocery_store/features/wishlist/ui/wishlist_tile_widget.dart';

class Wishlist extends StatefulWidget{
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {

  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist Items"),
        backgroundColor: Colors.blue,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch(state.runtimeType){
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistItems.length,
                itemBuilder: (context, index) {
                  return WishlistItemWidget(
                      product: successState.wishlistItems[index],
                      wishlistBloc: wishlistBloc,
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}