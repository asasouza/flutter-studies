import 'package:flutter/material.dart';

import './cart.dart';

class OrderItem {
  final double amount;
  final DateTime date;
  final String id;
  final List<CartItem> products;

  OrderItem({
    @required this.amount,
    @required this.date,
    @required this.id,
    @required this.products,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(double amount, List<CartItem> products) {
    _orders.insert(
      0,
      OrderItem(
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        products: products,
      ),
    );
    notifyListeners();
  }
}
