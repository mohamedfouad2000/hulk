import 'datum.dart';

class ProductModel {
  bool? sucsses;
  List<Datum>? data;

  ProductModel({this.sucsses, this.data});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        sucsses: json['sucsses'] as bool?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'sucsses': sucsses,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
