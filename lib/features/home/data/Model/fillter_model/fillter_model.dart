import 'datum.dart';

class FillterModel {
  bool? sucsses;
  List<Datum>? data;

  FillterModel({this.sucsses, this.data});

  factory FillterModel.fromJson(Map<String, dynamic> json) => FillterModel(
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
