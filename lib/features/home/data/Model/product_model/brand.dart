import 'translation.dart';

class Brand {
  int? id;
  String? name;
  String? image;
  String? link;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  List<Translation>? translations;

  Brand({
    this.id,
    this.name,
    this.image,
    this.link,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.translations,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        link: json['link'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt:
            json['updated_at'] == null ? null : (json['updated_at'] as String),
        imagePath: json['image_path'] as String?,
        translations: (json['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'link': link,
        'created_at': createdAt,
        'updated_at': updatedAt?.toString(),
        'image_path': imagePath,
        'translations': translations?.map((e) => e.toJson()).toList(),
      };
}
