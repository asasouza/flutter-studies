import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          ListTile(
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date),
            ),
            title: Text(
              '\$ ${widget.order.amount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 25),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final product = widget.order.products[index];
                  return Row(
                    children: <Widget>[
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${product.quantity} x \$${product.price}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  );
                },
                itemCount: widget.order.products.length,
              ),
              height: min(widget.order.products.length * 20.0 + 10, 100),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 6,
              ),
            )
        ],
      ),
      margin: EdgeInsets.all(10),
    );
  }
}
