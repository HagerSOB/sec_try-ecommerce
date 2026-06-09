import 'dart:math';

import 'package:ecommerce/CustomWidgets/custom-evaButton.dart';
import 'package:ecommerce/CustomWidgets/custom_cached_image.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/modles/Product_Modle.dart';
import 'package:ecommerce/views/productDetails/product-details-view.dart';
import 'package:flutter/material.dart';
import 'package:pay_with_paymob/pay_with_paymob.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({

    super.key,required this.product, this.onTap,required this.isFevorite, required this.onPaymentSuccess
  });
 final ProductModel product;
 final Function()? onTap;
  final VoidCallback onPaymentSuccess;

  final  bool isFevorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context)=> ProductDetailsView(product: product,))),
      child: Card(
        shape: const RoundedRectangleBorder(
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
                      child:
                      CustomCachedImage(
                        url: product.imageUrl,
                      )),
                  Positioned(
                      child: Container(
                        child:  Center(
                            child: Text(
                              "${product.sale}off",
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
                       Text(
                        product.productName,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      IconButton(
                          onPressed: onTap,
                          icon:  Icon(
                            Icons.favorite,
                            color: isFevorite? AppColors.kPrimaryColor: AppColors.kGreyColor,
                          ))
                    ],
                  ),
                   Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  product.price,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                                CustomEvaButton(Lable: 'Buy Now!', onPressed: () {Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaymentView(
                                      onPaymentSuccess:onPaymentSuccess,
                                      onPaymentError: () {
                                        log("ERROR" as num);
                                      },
                                      price: double.parse(product.price), // Required: Total price (e.g., 100 for 100 EGP)
                                    ),
                                  ),
                                );  },),
                              ],
                            ),
                            Text(
                              product.oldPrice,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: AppColors.kGreyColor),
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
      ),
    );
  }
}
