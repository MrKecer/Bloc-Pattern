import 'dart:async';

import 'package:bloc/data/cartService.dart';

import '../models/cart.dart';

class CartBloc {
  final cartSreamController =
      StreamController.broadcast(); //streamde sürekli async olarak akış vardır
  Stream get getStream => cartSreamController.stream;

  void addToCart(Cart item) {
    CartService.addToCart(item);
    cartSreamController.sink.add(
        CartService.getCart()); //streami sink sayesinde sürekli tetikliyoruz
  }

  void removeFromCart(Cart item) {
    CartService.removeFromCart(item);
    cartSreamController.sink.add(CartService.getCart());
  }

  List<Cart> getCart() {
    return CartService.getCart();
  }
}

final cartBloc = CartBloc(); //referans yardımıyla haberleşme oluşturuldu
