import 'package:flutter/material.dart';

import './models/meal.dart';

import './screens/category_meals.dart';
import './screens/meal_detail.dart';
import './screens/settings.dart';
import './screens/tabs.dart';

import './datas/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _meals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filters = filters;
      _meals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(String mealId) {
    final index = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if(index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));  
      });
    }
  }

  bool _isFavoriteMeal(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          accentColor: Colors.amberAccent,
          canvasColor: Colors.white,
          fontFamily: 'Raleway',
          primarySwatch: Colors.pink,
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      // home: CategoriesScreen(),
      routes: {
        TabsScreen.routeName: (_) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(_meals),
        MealDetail.routeName: (_) => MealDetail(_toggleFavoriteMeal, _isFavoriteMeal),
        SettingsScreen.routeName: (_) => SettingsScreen(_filters, _setFilters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => TabsScreen(_favoriteMeals),
        );
      },
    );
  }
}
