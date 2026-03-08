import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CutomCirucleIND extends StatelessWidget {
  const CutomCirucleIND({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.kPrimaryColor,));
  }
}
