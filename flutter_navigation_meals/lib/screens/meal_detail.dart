import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = args['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Center(
        child: Text('Meal Details'),
      ),
    );
  }
}
