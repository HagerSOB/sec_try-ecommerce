import 'package:ecommerce/CustomWidgets/custom-card.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/profile/widgets/edit-nameView.dart';
import 'package:ecommerce/views/profile/widgets/my-ordersView.dart';
import 'package:flutter/material.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            color: AppColors.kWhiteColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.kPrimaryColor,
                    child: Icon(
                      Icons.person,
                      size: 45,
                      color: AppColors.kWhiteColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "User Name",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kBlackColor),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "User Email",
                  style: TextStyle(fontSize: 15, color: AppColors.kGreyColor),
                ),
                const SizedBox(height: 12),
                CustomCard(
                    title: "Edit Name",
                    backgroundColor: AppColors.kScaffoldColor,
                    icon: Icons.person,
                    contentColor: AppColors.kWhiteColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditNameview()),
                      );                    }),
                const SizedBox(height: 12),
                CustomCard(
                    title: "My Orders",
                    backgroundColor: AppColors.kScaffoldColor,
                    icon: Icons.shopping_basket,
                    contentColor: AppColors.kWhiteColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyOrdersView()),
                      );
                    }),
                const SizedBox(height: 12),
                CustomCard(
                    title: "Logout",
                    backgroundColor: AppColors.kScaffoldColor,
                    icon: Icons.logout,
                    contentColor: AppColors.kWhiteColor,
                    onTap: () {}),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
