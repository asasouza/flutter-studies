import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

import './edit_product.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
        title: Text('Your Products'),
      ),
      body: Padding(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final product = products.items[index];
            return UserProductItem(
              id: product.id,
              imageUrl: product.imageUrl,
              price: product.price,
              title: product.title,
            );
          },
          itemCount: products.items.length,
        ),
        padding: EdgeInsets.all(8),
      ),
      drawer: AppDrawer(),
    );
  }
}
