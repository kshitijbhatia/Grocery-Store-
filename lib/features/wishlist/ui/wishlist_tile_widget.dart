import 'package:flutter/material.dart';
import 'package:grocery_store/features/home/models/home_product_data_model.dart';
import 'package:grocery_store/features/wishlist/bloc/wishlist_bloc.dart';

class WishlistItemWidget extends StatelessWidget{
  const WishlistItemWidget({super.key, required this.product, required this.wishlistBloc});

  final ProductDataModel product;
  final WishlistBloc wishlistBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product.image))),
          ),
          const SizedBox(height: 20),
          Text(product.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(product.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product.price}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        wishlistBloc.add(WishlistRemoveProductEvent(
                          product: product
                        ));
                      },
                      icon: const Icon(Icons.favorite_outlined)),
                  IconButton(
                      onPressed: () {
                        // cartBloc.add(HomeProductCartButtonClickedEvent(
                        //     clickedProduct: product
                        // ));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}