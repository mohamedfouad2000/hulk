class Translation {
  String? translationableType;
  int? translationableId;
  String? locale;
  String? key;
  String? value;
  int? id;

  Translation({
    this.translationableType,
    this.translationableId,
    this.locale,
    this.key,
    this.value,
    this.id,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        translationableType: json['translationable_type'] as String?,
        translationableId: json['translationable_id'] as int?,
        locale: json['locale'] as String?,
        key: json['key'] as String?,
        value: json['value'] as String?,
        id: json['id'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'translationable_type': translationableType,
        'translationable_id': translationableId,
        'locale': locale,
        'key': key,
        'value': value,
        'id': id,
      };
}
