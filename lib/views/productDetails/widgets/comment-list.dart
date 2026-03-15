import 'package:ecommerce/views/productDetails/widgets/comment-user.dart';
import 'package:flutter/material.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true
        ,physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index)=>Comments(),
        separatorBuilder: (context,index)=>Divider(), itemCount: 10);
  }
}
