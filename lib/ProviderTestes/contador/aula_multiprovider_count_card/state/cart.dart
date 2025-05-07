import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<String> _cart = [];
  List<String> get cart => _cart;

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  void addItem(String item) {
    _cart.add(item);
    listKey.currentState?.insertItem(_cart.length - 1);
    notifyListeners();
  }

  int get count => _cart.length;
}
