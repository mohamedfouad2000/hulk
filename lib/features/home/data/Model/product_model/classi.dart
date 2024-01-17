import 'translation.dart';

class Classi {
  int? id;
  String? color;
  String? title;
  String? createdAt;
  String? updatedAt;
  List<Translation>? translations;

  Classi({
    this.id,
    this.color,
    this.title,
    this.createdAt,
    this.updatedAt,
    this.translations,
  });

  factory Classi.fromJson(Map<String, dynamic> json) => Classi(
        id: json['id'] as int?,
        color: json['color'] as String?,
        title: json['title'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt:
            json['updated_at'] == null ? null : (json['updated_at'] as String),
        translations: (json['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'color': color,
        'title': title,
        'created_at': createdAt,
        'updated_at': updatedAt?.toString(),
        'translations': translations?.map((e) => e.toJson()).toList(),
      };
}
