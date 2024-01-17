import 'translation.dart';

class Category {
  int? id;
  String? name;
  String? image;
  dynamic description;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  List<Translation>? translations;

  Category({
    this.id,
    this.name,
    this.image,
    this.description,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.translations,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as dynamic,
        status: json['status'] as String?,
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
        'description': description,
        'status': status,
        'created_at': createdAt,
        'updated_at': updatedAt?.toString(),
        'image_path': imagePath,
        'translations': translations?.map((e) => e.toJson()).toList(),
      };
}
