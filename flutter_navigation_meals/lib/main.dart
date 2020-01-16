import 'package:flutter/material.dart';

import './screens/category_meals.dart';
import './screens/meal_detail.dart';
import './screens/settings.dart';
import './screens/tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        TabsScreen.routeName: (_) => TabsScreen(),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
        MealDetail.routeName: (_) => MealDetail(),
        SettingsScreen.routeName: (_) => SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => TabsScreen(),
        );
      },
    );
  }
}
