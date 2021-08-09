import 'package:flutter/material.dart';
import 'package:flutter_shop_application/providers/products.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widget/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFav;
  const ProductsGrid({Key? key, required this.showFav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFav ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 100),
      itemBuilder: (context, i) => ChangeNotifierProvider.value(
        // builder: (c) => products[i],
        value: products[i],
        child: ProductItem(
            // id: products[i].id,
            // title: products[i].title,
            // imageUrl: products[i].imageUrl),
            ),
      ),
    );
  }
}
