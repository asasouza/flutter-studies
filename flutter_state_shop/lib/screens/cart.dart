import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart' show Cart;

import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Padding(
              child: Row(
                children: <Widget>[
                  Text(
                    'TOTAL',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '\$ ${cart.itemsSum.toStringAsFixed(2)}',
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  Spacer(),
                  OutlineButton(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Text('ORDER NOW'),
                    onPressed: () {},
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              padding: EdgeInsets.all(8),
            ),
            margin: EdgeInsets.all(15),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final cartItem = cart.items.values.toList()[index];
                return CartItem(
                  id: cartItem.id,
                  price: cartItem.price,
                  productId: cart.items.keys.toList()[index],
                  quantity: cartItem.quantity,
                  title: cartItem.title,
                );
              },
              itemCount: cart.items.length,
            ),
          ),
        ],
      ),
    );
  }
}
