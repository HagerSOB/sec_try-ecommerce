
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/views/fevorite/fevoriteView.dart';
import 'package:ecommerce/views/home/UI/HomeView.dart';
import 'package:ecommerce/views/navBar/logic/nav-bar-cubit.dart';
import 'package:ecommerce/views/navBar/logic/nav-bar-state.dart';
import 'package:ecommerce/views/profile/profileView.dart';
import 'package:ecommerce/views/store/storeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
class Mainhomeview extends StatelessWidget {
   Mainhomeview({super.key});
  final List<Widget> views=[
    const HomeView(),
    const FevoriteView(),

    const StoreView(),
    const Profileview()

  ];

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context){
        return NavBarCubit();
      },
      child: BlocBuilder <NavBarCubit,NavBarState>(
        builder: ( context,  state) {
         NavBarCubit cubit= BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(child:views[cubit.currentIndex]
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  color: AppColors.kWhiteColor
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                child: GNav(
                 onTabChange: (index){
cubit.changeCurrentIndex(index);
                   },
                    rippleColor: Colors.grey[800]!, // tab button ripple color when pressed
                    hoverColor: Colors.grey[700]!, // tab button hover color
                    tabBorderRadius: 15,
                    tabActiveBorder: Border.all(color: AppColors.kPrimaryColor.withOpacity(0.6)), // tab button border
                    tabBorder: Border.all(color: AppColors.kWhiteColor, width: 1), // tab button border
                    duration: Duration(milliseconds: 20), // tab animation duration
                    gap: 2, // the tab button gap between icon and text
                    color: AppColors.kGreyColor, // unselected icon color
                    activeColor:AppColors.kPrimaryColor, // selected icon and text color
                    iconSize: 24, // tab button icon size
                    tabBackgroundColor: AppColors.kWhiteColor, // selected tab background color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // navigation bar padding
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: Icons.favorite,
                        text: 'favorite',
                      ),
                      GButton(
                        icon: Icons.store,
                        text: 'Store',
                      ),
                      GButton(
                        icon: Icons.person,
                        text: 'Profile',
                      )
                    ]
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
