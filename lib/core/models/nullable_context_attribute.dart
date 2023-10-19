import 'package:json_annotation/json_annotation.dart';

part 'nullable_context_attribute.g.dart';

@JsonSerializable()
class NullableContextAttribute {
  Object? typeId;

  NullableContextAttribute(this.typeId,);

  factory NullableContextAttribute.fromJson(Map<String, dynamic> json) => _$NullableContextAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$NullableContextAttributeToJson(this);
}