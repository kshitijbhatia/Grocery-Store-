import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:grocery_store/data/wishlist_items.dart';
import 'package:grocery_store/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveProductEvent>(wishlistRemoveProductEvent);
  }

  FutureOr<void> wishlistInitialEvent(WishlistInitialEvent event ,Emitter<WishlistState> emit){
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> wishlistRemoveProductEvent(WishlistRemoveProductEvent event, Emitter<WishlistState> emit){
    final product = event.product;
    wishlistItems.remove(event.product);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
