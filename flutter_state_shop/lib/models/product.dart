import 'package:flutter/foundation.dart';

class Product {
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
}
