import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/product_detail.dart';
import './screens/products_overview.dart';

import './models/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      child: MaterialApp(
        title: 'Shop App',
        theme: ThemeData(
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          primarySwatch: Colors.purple,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
        },
      ),
      value: Products(),
    );
  }
}
