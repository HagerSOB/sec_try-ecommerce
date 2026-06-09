import 'package:ecommerce/CustomWidgets/custom_cirucle_ind.dart';
import 'package:ecommerce/core/modles/HomeLogic/home_cubit.dart';
import 'package:ecommerce/core/modles/Product_Modle.dart';
import 'package:ecommerce/core/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key, this.shrinkWrap, this.physics, this.query, this.category, this.isFavoriteViwe=false,
  });

  final bool ?shrinkWrap;
  final ScrollPhysics ? physics;
final String ?query;
  final String ? category;
  final bool ?isFavoriteViwe;
  /*d*/


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      HomeCubit()
        ..getProducts(query: query,category: category),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          HomeCubit homeCubit=context.read<HomeCubit>();
          List<ProductModel> products=query!=null?homeCubit.SearchResults:
          isFavoriteViwe!?homeCubit.favoriteProductList:
          category!=null? homeCubit.categoryProducts
          :context.read<HomeCubit>().products;
          return state is GetDataLoading ?CutomCirucleIND():ListView.builder(shrinkWrap: shrinkWrap ?? true,
            physics: physics ?? NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return  ProductCard(isFevorite: homeCubit.checkIsFavorite(products[index].id)
                  ,product: products[index],onTap:(){
                bool isFavorite=homeCubit.checkIsFavorite(products[index].id);
                isFavorite?homeCubit.RemoveFavorite(products[index].id):homeCubit.addToFevorite(products[index].id);
              }, onPaymentSuccess: () {  },);
            },);
        },
      ),
    );
  }
}
