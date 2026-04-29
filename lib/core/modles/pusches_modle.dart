class PurchaseTable {
  final String id;
  final String forUser;
  final bool isBought;
  final String createdAt;
  final String forProduct;

  PurchaseTable({
    required this.id,
    required this.forUser,
    required this.isBought,
    required this.createdAt,
    required this.forProduct,
  });

  factory PurchaseTable.fromJson(Map<String, dynamic> json) {
    return PurchaseTable(
      id: json['id'],
      forUser: json['for_user'],
      isBought: json['is_bought'],
      createdAt: json['created_at'],
      forProduct: json['for_product'],
    );
  }
}