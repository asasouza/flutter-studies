import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  final String token;
  List<OrderItem> _orders = [];

  Orders(this.token, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() {
    final url = 'https://flutter-studies-5fc09.firebaseio.com/orders.json?auth=$token';
    return http.get(url).then((response) {
      var decodedResponse = json.decode(response.body) as Map<String, dynamic>;
      if (decodedResponse == null) {
        return;
      }
      final List<OrderItem> loadedOrders = [];
      decodedResponse.forEach((orderId, order) {
        loadedOrders.add(OrderItem(
          id: orderId,
          amount: order['amount'],
          date: DateTime.parse(order['date']),
          products: (order['products'] as List<dynamic>)
              .map((cartItem) => CartItem(
                    id: cartItem['id'],
                    price: cartItem['price'],
                    quantity: cartItem['quantity'],
                    title: cartItem['title'],
                  ))
              .toList(),
        ));
        _orders = loadedOrders.reversed.toList();
        notifyListeners();
      });
    });
  }

  Future<void> addOrder(double amount, List<CartItem> products) {
    final url = 'https://flutter-studies-5fc09.firebaseio.com/orders.json?auth=$token';
    final timestamp = DateTime.now();
    return http
        .post(url,
            body: json.encode({
              'amount': amount,
              'date': timestamp.toIso8601String(),
              'products': products
                  .map((product) => {
                        'id': product.id,
                        'price': product.price,
                        'quantity': product.quantity,
                        'title': product.title,
                      })
                  .toList()
            }))
        .then((response) {
      _orders.insert(
        0,
        OrderItem(
          amount: amount,
          date: timestamp,
          id: json.decode(response.body)['name'],
          products: products,
        ),
      );
      notifyListeners();
    });
  }
}
