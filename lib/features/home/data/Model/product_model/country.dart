class Country {
  int? id;
  int? companyId;
  int? countryId;
  String? createdAt;
  String? updatedAt;
  Country? country;

  Country({
    this.id,
    this.companyId,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.country,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json['id'] as int?,
        companyId: json['company_id'] as int?,
        countryId: json['country_id'] as int?,
        createdAt:
            json['created_at'] == null ? null : (json['created_at'] as String),
        updatedAt:
            json['updated_at'] == null ? null : (json['updated_at'] as String),
        country: json['country'] == null
            ? null
            : Country.fromJson(json['country'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'company_id': companyId,
        'country_id': countryId,
        'created_at': createdAt?.toString(),
        'updated_at': updatedAt?.toString(),
        'country': country?.toJson(),
      };
}
