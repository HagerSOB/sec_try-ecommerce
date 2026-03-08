import 'package:ecommerce/CustomWidgets/customSearchField.dart';
import 'package:ecommerce/core/products-list.dart';
import 'package:flutter/material.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
       Center(
         child: const Text(
            "Welcom To Our Market",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
       ),
        const SizedBox(
          height: 20,
        ),
        const CustomSearchField(),
        const SizedBox(
          height: 20,
        ),
        ProductList()
      ]),
    );



}}
