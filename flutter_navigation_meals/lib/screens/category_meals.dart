import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../datas/meals.dart';

class CategoryMealsScreen extends StatelessWidget {
  static String routeName = '/category-meals';
  // final String id;
  // final String title;

  // CategoryMealsScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final navigationArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = navigationArgs['id'];
    final title = navigationArgs['title'];
    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final meal = meals[index];
          return MealItem(
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            id: meal.id,
            imageUrl: meal.imageUrl,
            title: meal.title,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
