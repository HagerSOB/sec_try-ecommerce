import 'package:ecommerce/CustomWidgets/CustomTextField.dart';
import 'package:ecommerce/CustomWidgets/custom_cached_image.dart';
import 'package:ecommerce/CustomWidgets/custom_cirucle_ind.dart';
import 'package:ecommerce/core/Methods/custom-appBar.dart';
import 'package:ecommerce/core/Methods/navgation.dart';
import 'package:ecommerce/core/app_colors.dart';
import 'package:ecommerce/core/modles/Product_Modle.dart';
import 'package:ecommerce/views/auth/logic/cubit/auth-cubit.dart';
import 'package:ecommerce/views/productDetails/logic/product_datails_cubit.dart';
import 'package:ecommerce/views/productDetails/widgets/comment-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  TextEditingController _commentController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDatailsCubit()..getRates(productId: widget.product.id),
      child: BlocConsumer<ProductDatailsCubit, ProductDatailsState>(
        listener: (context, state) {
          if (state is AddOrUpdateRateSucsses) {
            buildPushReplacement(
                context,
                ProductDetailsView(
                  product: widget.product,
                ));
          }
        },
        builder: (context, state) {
          ProductDatailsCubit cubit = context.read<ProductDatailsCubit>();
          return state is GetRateLoading ||state is AdacommentLoading
              ? CutomCirucleIND()
              : Scaffold(
                  appBar: CustomAppBar(context, "Product Name"),
                  body: ListView(
                    children: [
                      const SizedBox(height: 10),
                      CustomCachedImage(url: widget.product.imageUrl),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 30),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [Text("Product Name"), Text("125 LE")],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("${cubit.avrageRate}"),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    )
                                  ],
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: AppColors.kGreyColor,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("data"),
                            const SizedBox(
                              height: 20,
                            ),
                            RatingBar.builder(
                              initialRating: cubit.userRate!.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                cubit.addORUpdateUsrRate(
                                    productId: widget.product.id,
                                    data: {
                                      "for_user": cubit.userId,
                                      "for_product": widget.product.id,
                                      "rate": rating.toInt()
                                    });
                              },
                            ),
                            SizedBox(height: 20),
                            CustomTextField(
                              controller: _commentController,
                              hintText: "Type Your Feedback",
                              SuuffIcon: IconButton(
                                  onPressed: () async{
await cubit.addComment(data:{
  "comment": _commentController.text,
  "for_user": cubit.userId,
  "for_product":  widget.product.id,
  "user_name": context.read<AuthCubit>().currentUserModel?.name ??"User_Name"
} );
_commentController.clear();
                                  },
                                  icon: Icon(Icons.send)),
                              onChanged: (String) {},
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text(
                                  "data",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            CommentsList()
                          ],
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );

  }
@override
  void dispose() {
    // TODO: implement dispose
    _commentController.dispose();
    super.dispose();
  }

}
