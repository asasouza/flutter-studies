import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';

class Products with ChangeNotifier {
  final url = 'https://flutter-studies-5fc09.firebaseio.com/products.json';

  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  Future<void> fetchAndSetItems() {
    return http.get(url)
    .then((response) {
      var decodedResponse = json.decode(response.body) as Map<String, dynamic>;
      decodedResponse.forEach((productId, product) {
        _items.add(Product(
          id: productId,
          description: product['description'],
          imageUrl: product['imageUrl'],
          isFavorite: product['isFavorite'],
          price: product['price'],
          title: product['title'],
        ));
      });
      notifyListeners();
    });
  }

  Future<void> addNewItem(Product product) {
    return http
        .post(
      url,
      body: json.encode({
        'description': product.description,
        'imageUrl': product.imageUrl,
        'title': product.title,
        'price': product.price,
        'isFavorite': product.isFavorite,
      }),
    )
        .then((response) {
      var newProduct = Product(
        id: json.decode(response.body)['name'],
        description: product.description,
        imageUrl: product.imageUrl,
        title: product.title,
        price: product.price,
      );
      _items.add(newProduct);
      notifyListeners();
    });
  }

  void updateItem(String id, Product product) {
    final index = _items.indexWhere((product) => product.id == id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteItem(String id) {
    _items.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }
}
