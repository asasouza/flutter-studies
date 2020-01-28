import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final double price;
  final String title;

  UserProductItem({this.id, this.imageUrl, this.price, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          radius: 30,
        ),
        subtitle: Text('\$ $price'),
        title: Text(title),
        trailing: Container(
          child: Row(
            children: <Widget>[
              IconButton(
                color: Theme.of(context).primaryColor,
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
              IconButton(
                color: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
            ],
          ),
          width: 100,
        ),
      ),
    );
  }
}
