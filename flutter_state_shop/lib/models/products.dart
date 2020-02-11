import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './exception_http.dart';
import './product.dart';

class Products with ChangeNotifier {
  final String token;
  List<Product> _items = [];

  Products(this.token, this._items);

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((product) => product.isFavorite).toList();
  }

  Future<void> fetchAndSetItems() {
    final url = 'https://flutter-studies-5fc09.firebaseio.com/products.json?auth=$token';
    return http.get(url).then((response) {
      var decodedResponse = json.decode(response.body) as Map<String, dynamic>;
      if(decodedResponse == null) {
        return;
      }
      final List<Product> loadedProducts = [];
      decodedResponse.forEach((productId, product) {
        loadedProducts.add(Product(
          id: productId,
          description: product['description'],
          imageUrl: product['imageUrl'],
          isFavorite: product['isFavorite'],
          price: product['price'],
          title: product['title'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    });
  }

  Future<void> addNewItem(Product product) {
    final url = 'https://flutter-studies-5fc09.firebaseio.com/products.json?auth=$token';
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

  Future<void> updateItem(String id, Product product) {
    final index = _items.indexWhere((product) => product.id == id);
    if (index >= 0) {
      final url =
          'https://flutter-studies-5fc09.firebaseio.com/products/$id.json?auth=$token';
      return http
          .patch(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
        }),
      )
          .then((_) {
        _items[index] = product;
        notifyListeners();
      });
    }
    return Future.value();
  }

  Future<void> deleteItem(String id) {
    final url = 'https://flutter-studies-5fc09.firebaseio.com/products/$id.json?auth=$token';
    final index = _items.indexWhere((product) => product.id == id);
    var product = _items[index];
    _items.removeAt(index);
    notifyListeners();
    return http.delete(url).then((response) {
      if (response.statusCode >= 400) {
        _items.insert(index, product);
        notifyListeners();
        throw HttpException('Deleting failed!');
      } else {
        product = null;
      }
    });
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }
}
