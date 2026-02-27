import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/CustomWidgets/customSearchField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomSearchField(),
          SizedBox(height: 20,),
          Image.asset("assets/images/shopping.jpg",)
          ]),
    );
  }
}
