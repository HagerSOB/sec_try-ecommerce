class FavoriteProduct {
  final String id;
  final String forUser;
  final String createdAt;
  final bool isFavorite;
  final String forProduct;

  FavoriteProduct({
    required this.id,
    required this.forUser,
    required this.createdAt,
    required this.isFavorite,
    required this.forProduct,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'],
      forUser: json['for_user'],
      createdAt: json['created_at'],
      isFavorite: json['is_favorit'], // لاحظت الـ typo في الـ JSON
      forProduct: json['for_product'],
    );
  }
}