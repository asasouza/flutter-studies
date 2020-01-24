import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final String productId;
  final int quantity;
  final String title;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.productId,
    @required this.quantity,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        alignment: Alignment.centerRight,
        child: Padding(
          child: Icon(
            Icons.delete,
            color: Colors.white,
            size: 40,
          ),
          padding: EdgeInsets.all(10),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).errorColor,
        ),
      ),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              child: FittedBox(
                child: Text('\$ ${(quantity * price).toStringAsFixed(2)}'),
              ),
              padding: EdgeInsets.all(5),
            ),
            radius: 30,
          ),
          subtitle: Text('Unit price: \$ $price'),
          title: Text(title),
          trailing: Text('$quantity x'),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      onDismissed: (_) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
    );
  }
}
