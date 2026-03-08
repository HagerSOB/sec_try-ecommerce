import 'package:ecommerce/core/products-list.dart';
import 'package:flutter/material.dart';

class FevoriteView extends StatelessWidget {
  const FevoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        Center(
          child: const Text(
            "Your Fevorite Products",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ProductList()
      ]),
    );
  }
}
