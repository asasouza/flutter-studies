import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/orders.dart' show Orders;

import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItem(orders.orders[index]),
        itemCount: orders.orders.length,
      ),
      drawer: AppDrawer(),
    );
  }
}
