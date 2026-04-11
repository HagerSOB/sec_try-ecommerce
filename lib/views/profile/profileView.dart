import 'package:ecommerce/CustomWidgets/custom-card.dart';
import 'package:ecommerce/CustomWidgets/custom_cirucle_ind.dart';
import 'package:ecommerce/core/Methods/navgation.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-cubit.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-state.dart';
import 'package:ecommerce/views/auth/ui/login-viwe.dart';
import 'package:ecommerce/views/profile/widgets/edit-nameView.dart';
import 'package:ecommerce/views/profile/widgets/my-ordersView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AuthCubit, AuthenState>(

      builder: (BuildContext context, state) {
        return state is LogOutLoading ? const CutomCirucleIND() : Padding(
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
                      style: TextStyle(
                          fontSize: 15, color: AppColors.kGreyColor),
                    ),
                    const SizedBox(height: 12),
                    CustomCard(
                        title: "Edit Name",
                        backgroundColor: AppColors.kScaffoldColor,
                        icon: Icons.person,
                        contentColor: AppColors.kWhiteColor,
                        onTap: () {
                          buildPushReplacement(context, const EditNameview());
                        }),
                    const SizedBox(height: 12),
                    CustomCard(
                        title: "My Orders",
                        backgroundColor: AppColors.kScaffoldColor,
                        icon: Icons.shopping_basket,
                        contentColor: AppColors.kWhiteColor,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyOrdersView()),
                          );
                        }),
                    const SizedBox(height: 12),
                    CustomCard(
                        title: "Logout",
                        backgroundColor: AppColors.kScaffoldColor,
                        icon: Icons.logout,
                        contentColor: AppColors.kWhiteColor,
                        onTap: () async {
                          await context.read<AuthCubit>().signOut();
                        }),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ],
          ),
        );
      }, listener: (context, state) {
      if (state is LogOutSuccses) {
        buildPushReplacement(context, const LoginViwe());
      }
    },
    );
  }

}