
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget ? SuuffIcon;
  final String ? name;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.onChanged, this.validator, this.SuuffIcon, this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: SuuffIcon,
            hintStyle: TextStyle(color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.kGreyColor),
            ),
            filled: true,
            fillColor: AppColors.kWhiteColor,
          ),
          onChanged: onChanged),
    );
  }
}
