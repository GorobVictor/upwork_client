import 'package:json_annotation/json_annotation.dart';

part 'single_value_dto.g.dart';

@JsonSerializable()
class SingleValueDto {
  int? id;
  String? value;

  SingleValueDto(this.id,this.value,);

  factory SingleValueDto.fromJson(Map<String, dynamic> json) => _$SingleValueDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SingleValueDtoToJson(this);
}