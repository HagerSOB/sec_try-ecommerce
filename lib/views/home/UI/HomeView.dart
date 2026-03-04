import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/views/home/widgets/categoriesList.dart';
import 'package:ecommerce/CustomWidgets/customSearchField.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        const CustomSearchField(),
        const SizedBox(
          height: 20,
        ),
        Image.asset(
          "assets/images/shopping.jpg",
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Popular categories",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
        const SizedBox(
          height: 15,
        ),
        const CategoriesList(),
        const SizedBox(
          height: 15,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            children: [
              Stack(
                children: [
                  Stack(children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        child: Image(
                          image: NetworkImage(
                              "https://cms.dresma.com/uploads/Header_79107acd68.jpg"),
                        )),
                    Positioned(
                        child: Container(
                      child: Center(
                          child: Text(
                        "10% off",
                        style: TextStyle(color: AppColors.kWhiteColor),
                      )),
                      width: 65,
                      height: 40,
                      decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                    ))
                  ])
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}
