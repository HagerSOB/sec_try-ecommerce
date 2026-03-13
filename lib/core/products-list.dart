import 'package:ecommerce/core/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key, this.shrinkWrap, this.physics,
  });
final bool ?shrinkWrap;
final ScrollPhysics ? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(shrinkWrap:shrinkWrap?? true,
      physics: physics??NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: ( context,  index) {
        return const ProductCard();
      },);
  }
}
