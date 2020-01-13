import 'package:flutter/material.dart';

class Category {
  final Color color;
  final String id;
  final String title;

  const Category({
    this.color = Colors.orange,
    @required this.id,
    @required this.title,
  });
}
