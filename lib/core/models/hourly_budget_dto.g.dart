// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_budget_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyBudgetDto _$HourlyBudgetDtoFromJson(Map<String, dynamic> json) =>
    HourlyBudgetDto(
      (json['min'] as num?)?.toDouble(),
      (json['max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HourlyBudgetDtoToJson(HourlyBudgetDto instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
    };
