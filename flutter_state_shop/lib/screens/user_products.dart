import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';

import './edit_product.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> fetchProducts(BuildContext context) {
    return Provider.of<Products>(context, listen: false).fetchAndSetItems(
      filterByUser: true,
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: fetchProducts(context),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                : RefreshIndicator(
                    child: Consumer<Products>(
                      builder: (context, products, _) => Padding(
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
                    ),
                    onRefresh: () => fetchProducts(context),
                  ),
      ),
      drawer: AppDrawer(),
    );
  }
}
