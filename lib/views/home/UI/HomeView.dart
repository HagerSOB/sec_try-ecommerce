import 'package:ecommerce/CustomWidgets/custom-evaButton.dart';
import 'package:ecommerce/CustomWidgets/custom_cached_image.dart';
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
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Column(
            children: [
              Stack(
                children: [
                  Stack(children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: CustomCachedImage(url: "https://cms.dresma.com/uploads/Header_79107acd68.jpg",)
                    ),
                    Positioned(
                        child: Container(
                      child: const Center(
                          child: Text(
                        "10% off",
                        style: TextStyle(color: AppColors.kWhiteColor),
                      )),
                      width: 65,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                    ))
                  ])
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Product Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: AppColors.kGreyColor,
                            ))
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "150 LE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  CustomEvaButton(),
                                ],
                              ),
                              Text(
                                "210",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,color: AppColors.kGreyColor),
                              ),

                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}



