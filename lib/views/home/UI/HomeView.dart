import 'package:ecommerce/CustomWidgets/custom-evaButton.dart';
import 'package:ecommerce/CustomWidgets/custom_cached_image.dart';
import 'package:ecommerce/core/product_card.dart';
import 'package:ecommerce/core/products-list.dart';
import 'package:ecommerce/views/home/widgets/categoriesList.dart';
import 'package:ecommerce/CustomWidgets/customSearchField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        const CustomSearchField(),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          "assets/images/shopping.jpg",
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Popular categories",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 15,
        ),
        const CategoriesList(),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Recently Products",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
        ProductList()
      ]),
    );
  }
}


