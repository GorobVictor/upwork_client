import 'package:json_annotation/json_annotation.dart';

part 'nullable_attribute.g.dart';

@JsonSerializable()
class NullableAttribute {
  Object? typeId;

  NullableAttribute(this.typeId,);

  factory NullableAttribute.fromJson(Map<String, dynamic> json) => _$NullableAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$NullableAttributeToJson(this);
}