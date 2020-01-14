import 'package:flutter/material.dart';

import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String id;
  final String title;

  CategoryItem({this.id, this.title, this.color});

  void onSelectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id, title);
    //     },
    //   ),
    // );
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(15),
      ),
      onTap: () => onSelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
    );
  }
}
