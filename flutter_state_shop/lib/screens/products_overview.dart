import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum PopMenuOptions { Favorites, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _onlyFavorites = false;

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
          )
        ],
        title: Text('My Shop'),
      ),
      body: ProductsGrid(_onlyFavorites),
    );
  }
}
