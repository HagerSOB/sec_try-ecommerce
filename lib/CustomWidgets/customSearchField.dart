import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/core/Methods/navgation.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/home/UI/SearchView.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key});

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  final TextEditingController  _Searchcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller:_Searchcontroller ,
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
                buildPushReplacement(context, Searchview(query: _Searchcontroller.text,));
                _Searchcontroller.clear();
              },

              label: const Icon(Icons.search)),
        ));
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _Searchcontroller.dispose();
    super.dispose();
  }
}
