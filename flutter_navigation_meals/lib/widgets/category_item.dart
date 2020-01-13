import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;

  CategoryItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
