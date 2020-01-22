import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './product_item.dart';

import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    
    return GridView.builder(
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductItem(
          id: product.id,
          imageUrl: product.imageUrl,
          title: product.title,
        );
      },
      itemCount: products.length,
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}