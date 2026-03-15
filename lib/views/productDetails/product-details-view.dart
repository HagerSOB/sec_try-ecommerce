import 'package:ecommerce/CustomWidgets/custom_cached_image.dart';
import 'package:ecommerce/core/Methods/custom-appBar.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(context,"Product Name"),body: ListView(
      children: [
        const SizedBox(height: 10),
        const CustomCachedImage(
          url:
          "https://cms.dresma.com/uploads/Header_79107acd68.jpg",
        ),Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 30),
          child: Column(
            children: [
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Name"),Text("125 LE")],
              ),
              const SizedBox(height: 20,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Row(
                  children: [Text("data "),Icon(Icons.star,color: Colors.amber,)],
                ),Icon(Icons.favorite,color: AppColors.kGreyColor,)],
              ),
              const SizedBox(height: 20,),
              const Text("data"),
      const SizedBox(height: 20,),
      RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    ),
              
            ],
          ),
        )
      ],
    ),
    );
  }
}
