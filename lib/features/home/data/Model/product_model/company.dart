class Company {
  int? id;
  int? productId;
  int? companyId;
  String? createdAt;
  String? updatedAt;
  Company? company;

  Company({
    this.id,
    this.productId,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.company,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'] as int?,
        productId: json['product_id'] as int?,
        companyId: json['company_id'] as int?,
        createdAt:
            json['created_at'] == null ? null : (json['created_at'] as String),
        updatedAt:
            json['updated_at'] == null ? null : (json['updated_at'] as String),
        company: json['company'] == null
            ? null
            : Company.fromJson(json['company'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'company_id': companyId,
        'created_at': createdAt?.toString(),
        'updated_at': updatedAt?.toString(),
        'company': company?.toJson(),
      };
}
