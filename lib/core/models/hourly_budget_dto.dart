import 'package:json_annotation/json_annotation.dart';

part 'hourly_budget_dto.g.dart';

@JsonSerializable()
class HourlyBudgetDto {
  double? min;
  double? max;

  HourlyBudgetDto(this.min,this.max,);

  factory HourlyBudgetDto.fromJson(Map<String, dynamic> json) => _$HourlyBudgetDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyBudgetDtoToJson(this);

  @override
  String toString() {
    return '$min - $max';
  }
}