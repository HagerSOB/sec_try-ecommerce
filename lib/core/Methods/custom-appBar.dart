import 'package:ecommerce/CustomWidgets/custom-icon.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

AppBar CustomAppBar(BuildContext context,String title) {
  return AppBar(
      centerTitle: true,
      title:Text(title,style: TextStyle(color: AppColors.kPrimaryColor),),
      leading:IconButton(onPressed:()=> Navigator.pop(context), icon: CustomIcon(icon: Icons.arrow_back_ios))
  );
}
