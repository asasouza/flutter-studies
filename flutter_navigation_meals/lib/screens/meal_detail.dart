import 'package:flutter/material.dart';

import '../datas/meals.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = '/meal-detail';

  Widget renderTitle(BuildContext context, String title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
    );
  }

  Widget renderListContainer(Widget child) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(10),
      width: 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = args['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 300,
              width: double.infinity,
            ),
            renderTitle(context, 'Ingredients'),
            renderListContainer(
              ListView.builder(
                itemBuilder: (context, index) => Padding(
                  child: Text(selectedMeal.ingredients[index]),
                  padding: EdgeInsets.all(5),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            renderTitle(context, 'Steps'),
            renderListContainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                        radius: 20,
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
        padding: EdgeInsets.only(bottom: 20),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.delete, color: Colors.white,),
        onPressed: () {
          Navigator.of(context).pop(id);
        },
      ),
    );
  }
}
