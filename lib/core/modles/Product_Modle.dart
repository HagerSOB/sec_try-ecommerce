import 'package:ecommerce/core/modles/favorite_modle.dart';
import 'package:ecommerce/core/modles/pusches_modle.dart';

class ProductModel {
  final String id;
  final String createdAt;
  final String productName;
  final String price;
  final String oldPrice;
  final String sale;
  final String? description; // nullable لأن فيه قيم null
  final String category;
  final String imageUrl;
  final List<FavoriteProduct>? favoriteProducts;
  final List<PurchaseTable>? purchaseTable;

  ProductModel({
    required this.id,
    required this.createdAt,
    required this.productName,
    required this.price,
    required this.oldPrice,
    required this.sale,
    this.description,
    required this.category,
    required this.imageUrl,
    this.favoriteProducts,
    this.purchaseTable,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      createdAt: json['created_at'],
      productName: json['product_name'],
      price: json['price'],
      oldPrice: json['old_price'],
      sale: json['sale'],
      description: json['descirption'], // لاحظت وجود حرف i زيادة في الـ JSON
      category: json['category'],
      imageUrl: json['image_url'],
      favoriteProducts: (json['favorite_products'] as List?)
          ?.map((e) => FavoriteProduct.fromJson(e))
          .toList(),
      purchaseTable: (json['purchase_table'] as List?)
          ?.map((e) => PurchaseTable.fromJson(e))
          .toList(),
    );
  }
}