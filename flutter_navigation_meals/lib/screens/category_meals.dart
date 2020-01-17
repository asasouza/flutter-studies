import 'package:flutter/material.dart';

import '../models/meal.dart';

import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static String routeName = '/category-meals';

  final List<Meal> meals;

  CategoryMealsScreen(this.meals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryId;
  List<Meal> meals;
  String categoryTitle;

  var initialized = false;

  @override
  void initState() {
    meals = widget.meals;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!initialized) {
      final navigationArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryId = navigationArgs['id'];
      categoryTitle = navigationArgs['title'];
      meals = meals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      initialized = true;
    }
    super.didChangeDependencies();
  }

  // _onRemoveMeal(String mealId) {
  //   setState(() {
  //     meals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
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
            // onRemoveMeal: _onRemoveMeal,
            title: meal.title,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
