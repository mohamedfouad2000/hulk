import 'brand.dart';
import 'category.dart';
import 'class.dart';
import 'company.dart';
import 'translation.dart';

class Datum {
  int? id;
  String? name;
  String? image;
  String? description;
  int? categoryId;
  int? brandId;
  String? createdAt;
  String? updatedAt;
  String? imagePath;
  Class? datumClass;
  Category? category;
  Brand? brand;
  List<Translation>? translations;
  List<Company>? companies;

  Datum({
    this.id,
    this.name,
    this.image,
    this.description,
    this.categoryId,
    this.brandId,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
    this.datumClass,
    this.category,
    this.brand,
    this.translations,
    this.companies,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        description: json['description'] as String?,
        categoryId: json['category_id'] as int?,
        brandId: json['brand_id'] as int?,
        createdAt: json['created_at'] as String?,
        updatedAt:
            json['updated_at'] == null ? null : (json['updated_at'] as String),
        imagePath: json['image_path'] as String?,
        datumClass: json['class'] == null
            ? null
            : Class.fromJson(json['class'] as Map<String, dynamic>),
        category: json['category'] == null
            ? null
            : Category.fromJson(json['category'] as Map<String, dynamic>),
        brand: json['brand'] == null
            ? null
            : Brand.fromJson(json['brand'] as Map<String, dynamic>),
        translations: (json['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
        companies: (json['companies'] as List<dynamic>?)
            ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'description': description,
        'category_id': categoryId,
        'brand_id': brandId,
        'created_at': createdAt,
        'updated_at': updatedAt?.toString(),
        'image_path': imagePath,
        'class': datumClass?.toJson(),
        'category': category?.toJson(),
        'brand': brand?.toJson(),
        'translations': translations?.map((e) => e.toJson()).toList(),
        'companies': companies?.map((e) => e.toJson()).toList(),
      };
}
