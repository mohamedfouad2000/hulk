class Datum {
  int? id;
  String? color;
  String? title;
  String? createdAt;
  DateTime? updatedAt;
  List<dynamic>? translations;

  Datum({
    this.id,
    this.color,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.translations,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        color: json['color'] as String?,
        title: json['title'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        translations: json['translations'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'color': color,
        'title': title,
        'created_at': createdAt,
        'updated_at': updatedAt?.toIso8601String(),
        'translations': translations,
      };
}
