import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 300,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '\$ ${product.price}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              child: Text(
                product.description,
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
