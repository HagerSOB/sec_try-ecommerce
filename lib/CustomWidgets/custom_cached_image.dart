import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/CustomWidgets/custom_cirucle_ind.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({
    super.key, required this.url,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:url,
      placeholder: (context, url) => SizedBox(
        height: 50,child: CutomCirucleIND(),

      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
