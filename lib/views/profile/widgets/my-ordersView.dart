import 'package:ecommerce/core/Methods/custom-appBar.dart';
import 'package:ecommerce/core/products-list.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppBar(context,"MyOrders"),body: ProductList(
      shrinkWrap: false,physics: BouncingScrollPhysics(),
    ),);
  }
}
