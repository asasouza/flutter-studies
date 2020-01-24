import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/cart.dart';
import './screens/product_detail.dart';
import './screens/products_overview.dart';

import './models/cart.dart';
import './models/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        )
      ],
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          primarySwatch: Colors.purple,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          CartScreen.routeName: (_) => CartScreen(),
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
        },
      ),
    );
  }
}
