import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/core/Methods/navgation.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/home/UI/SearchView.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.controller});
final TextEditingController ? controller;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller:controller ,
        hintText: 'Search in market..',
        onChanged: (String) {},
        SuuffIcon: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kWhiteColor,
                  foregroundColor: AppColors.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
              onPressed: () {
                buildPushReplacement(context, Searchview());
              },
              label: const Icon(Icons.search)),
        ));
  }
}
