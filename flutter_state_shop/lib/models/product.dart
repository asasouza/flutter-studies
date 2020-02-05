import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String description;
  final String id;
  final String imageUrl;
  final double price;
  final String title;
  bool isFavorite;

  Product({
    @required this.description,
    @required this.id,
    @required this.imageUrl,
    @required this.price,
    @required this.title,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    final oldFavorite = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url =
        'https://flutter-studies-5fc09.firebaseio.com/products/$id';
    http
        .patch(
      url,
      body: json.encode({'isFavorite': isFavorite}),
    )
        .then((response) {
      if (response.statusCode >= 400) {
        isFavorite = oldFavorite;
        notifyListeners();
      }
    });
  }
}
