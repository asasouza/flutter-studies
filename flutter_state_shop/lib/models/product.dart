import 'package:flutter/foundation.dart';

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
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
