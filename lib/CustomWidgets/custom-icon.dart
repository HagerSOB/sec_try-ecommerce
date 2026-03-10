
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.color});
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: color ?? AppColors.kPrimaryColor, size: 24);
  }
}
