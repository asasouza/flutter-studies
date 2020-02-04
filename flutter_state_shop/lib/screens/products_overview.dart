import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';

import '../models/cart.dart';
import '../models/products.dart';

import '../screens/cart.dart';

enum PopMenuOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _onlyFavorites = false;
  var _isLoading = true;

  @override
  void initState() {
    Provider.of<Products>(
      context,
      listen: false,
    ).fetchAndSetItems().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            child: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favorites'),
                value: PopMenuOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: PopMenuOptions.All,
              ),
            ],
            onSelected: (PopMenuOptions selectedOption) => {
              setState(() {
                if (selectedOption == PopMenuOptions.Favorites) {
                  _onlyFavorites = true;
                } else {
                  _onlyFavorites = false;
                }
              })
            },
          ),
          Consumer<Cart>(
            builder: (_, cart, child) => Badge(
              child: child,
              value: cart.countItems.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          )
        ],
        title: Text('My Shop'),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_onlyFavorites),
      drawer: AppDrawer(),
    );
  }
}
