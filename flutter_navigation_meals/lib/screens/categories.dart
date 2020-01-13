import 'package:flutter/material.dart';

import '../widgets/category_item.dart';

import '../datas/categories.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliMeals'),
      ),
      body: GridView(
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryItem(
            category.title,
            category.color,
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          maxCrossAxisExtent: 200,
        ),
        padding: EdgeInsets.all(20),
      ),
    );
  }
}
