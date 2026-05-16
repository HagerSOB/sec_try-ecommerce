import 'package:ecommerce/CustomWidgets/custom_cirucle_ind.dart';
import 'package:ecommerce/core/modles/HomeLogic/home_cubit.dart';
import 'package:ecommerce/core/modles/Product_Modle.dart';
import 'package:ecommerce/core/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key, this.shrinkWrap, this.physics, this.query, this.category,
  });

  final bool ?shrinkWrap;
  final ScrollPhysics ? physics;
final String ?query;
  final String ? category;

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
          List<ProductModel> products=query!=null?context.read<HomeCubit>().SearchResults:
          category!=null?context.read<HomeCubit>().categoryProducts
          :context.read<HomeCubit>().products;
          return state is GetDataLoading ?CutomCirucleIND():ListView.builder(shrinkWrap: shrinkWrap ?? true,
            physics: physics ?? NeverScrollableScrollPhysics(),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return  ProductCard(product: products[index],);
            },);
        },
      ),
    );
  }
}
