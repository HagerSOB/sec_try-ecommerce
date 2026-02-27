import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(hintText: 'Search in market..', onChanged: (String ) {  },
    SuuffIcon: Padding(
    padding: const EdgeInsets.only(right: 5),
    child: ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.kWhiteColor ,
    foregroundColor: AppColors.kPrimaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))
    ),
    onPressed: (){}, label:  const Icon(Icons.search)),
    )
    );
    }
    }



