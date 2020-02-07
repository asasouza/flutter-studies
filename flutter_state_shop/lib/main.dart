import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth.dart';
import './screens/cart.dart';
import './screens/edit_product.dart';
import './screens/orders.dart';
import './screens/product_detail.dart';
import './screens/products_overview.dart';
import './screens/user_products.dart';

import './models/auth.dart';
import './models/cart.dart';
import './models/orders.dart';
import './models/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProvider.value(
            value: Products(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider.value(
            value: Orders(),
          )
        ],
        child: Consumer<Auth>(
          builder: (context, auth, _) => MaterialApp(
            title: 'Shop App',
            theme: ThemeData(
              accentColor: Colors.deepOrange,
              fontFamily: 'Lato',
              primarySwatch: Colors.purple,
            ),
            home: auth.isAuthenticated ? ProductsOverviewScreen() : AuthScreen(),
            routes: {
              CartScreen.routeName: (_) => CartScreen(),
              EditProductScreen.routeName: (_) => EditProductScreen(),
              OrdersScreen.routeName: (_) => OrdersScreen(),
              ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
              ProductsOverviewScreen.routeName: (_) => ProductsOverviewScreen(),
              UserProductsScreen.routeName: (_) => UserProductsScreen(),
            },
          ),
        ));
  }
}
