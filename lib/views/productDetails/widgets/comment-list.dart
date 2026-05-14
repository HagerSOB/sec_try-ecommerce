
import 'package:ecommerce/CustomWidgets/custom_cirucle_ind.dart';
import 'package:ecommerce/core/modles/Product_Modle.dart';
import 'package:ecommerce/views/productDetails/widgets/comment-user.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key, required this.product,
  });
final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.from("comments_table").stream(primaryKey: ["id"]).eq("for_product",product.id).order("created_at")
      ,builder: (context, snapshot){
        List <Map<String,dynamic>>? data=snapshot.data;
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(child: CutomCirucleIND());
    }
    else if(!snapshot.hasData){
      return Center(
        child: Text("No Comments Yet"),
      );}
    else if(snapshot.hasData){
      return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Comments(commentData: data![index],),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: data?.length ?? 0,
      );

    }
    else{
    return Center(child: Text("Somthing went wrong,Please Try again"),);
    }
      });
  }
}