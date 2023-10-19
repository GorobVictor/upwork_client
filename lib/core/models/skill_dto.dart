import 'package:json_annotation/json_annotation.dart';

part 'skill_dto.g.dart';

@JsonSerializable()
class SkillDto {
  int? id;
  String? name;
  String? getName;

  SkillDto(this.id,this.name,this.getName,);

  factory SkillDto.fromJson(Map<String, dynamic> json) => _$SkillDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SkillDtoToJson(this);
}