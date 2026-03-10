import 'package:ecommerce/CustomWidgets/custom-icon.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color contentColor;
  final VoidCallback onTap;

  const CustomCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor=AppColors.kPrimaryColor,
    required this.contentColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CustomIcon(icon: icon, color: AppColors.kGreyColor),

              const SizedBox(width: 15),

              Text(
                  title,
                  style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  )
              ),

              const Spacer(),

              CustomIcon(icon: Icons.arrow_forward_ios, color: AppColors.kGreyColor),
            ],
          ),
        ),
      ),
    );
  }
}