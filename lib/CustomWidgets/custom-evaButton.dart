import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomEvaButton extends StatelessWidget {
  const CustomEvaButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          backgroundColor:
          AppColors.kPrimaryColor,
          foregroundColor: AppColors.kWhiteColor,
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(8))),
      onPressed: () {},
      label: Text("Buy Now!"),
    );
  }
}
