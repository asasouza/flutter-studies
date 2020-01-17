import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text('No favorite meals added - Add in the meal details!'),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        final meal = _favoriteMeals[index];
        return MealItem(
          affordability: meal.affordability,
          complexity: meal.complexity,
          duration: meal.duration,
          id: meal.id,
          imageUrl: meal.imageUrl,
          // onRemoveMeal: _onRemoveMeal,
          title: meal.title,
        );
      },
      itemCount: _favoriteMeals.length,
    );
  }
}
