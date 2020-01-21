import 'package:flutter/material.dart';

import './screens/product_detail.dart';
import './screens/products_overview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
