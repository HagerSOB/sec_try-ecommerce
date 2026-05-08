class RateModel {
  final String rateId;
  final String createdAt;
  final String forUser;
  final String forProduct;
  final int rate;

  RateModel({
    required this.rateId,
    required this.createdAt,
    required this.forUser,
    required this.forProduct,
    required this.rate,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      rateId: json['rate_id'] ?? '',
      createdAt: json['created_at'] ?? '',
      forUser: json['for_user'] ?? '',
      forProduct: json['for_product'] ?? '',
      rate: json['rate'] ?? 0,
    );
  }
}