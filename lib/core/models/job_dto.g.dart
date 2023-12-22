// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobDto _$JobDtoFromJson(Map<String, dynamic> json) => JobDto(
      json['id'] as int?,
      json['title'] as String?,
      json['description'] as String?,
      json['upWorkId'] as String?,
      json['link'] as String?,
      json['country'] as String?,
      json['priorityCountry'] as String?,
      json['isForbidden'] as bool?,
      json['createdOn'] == null
          ? null
          : DateTime.parse(json['createdOn'] as String),
      json['category'] == null
          ? null
          : SingleValueDto.fromJson(json['category'] as Map<String, dynamic>),
      (json['budget'] as num?)?.toDouble(),
      json['hourlyBudget'] == null
          ? null
          : HourlyBudgetDto.fromJson(
              json['hourlyBudget'] as Map<String, dynamic>),
      json['engagement'] == null
          ? null
          : SingleValueDto.fromJson(json['engagement'] as Map<String, dynamic>),
      json['workload'] == null
          ? null
          : SingleValueDto.fromJson(json['workload'] as Map<String, dynamic>),
      json['english'] == null
          ? null
          : SingleValueDto.fromJson(json['english'] as Map<String, dynamic>),
      $enumDecodeNullable(
          _$ContractorTierEnumMap, json['contractorTier'].toString()),
      (json['clientScore'] as num?)?.toDouble(),
      json['clientCountFeedback'] as int?,
      json['clientOpenJobs'] as int?,
      (json['history'] as List<dynamic>?)
          ?.map((e) => ChatGptHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isPriority'] as bool?,
      json['filterName'] as String?,
      (json['questions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['skills'] as List<dynamic>?)
          ?.map((e) => SkillDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..clientHireRate = json['clientHireRate'] as int?
      ..clientJobsPosted = json['clientJobsPosted'] as int?
      ..clientTotalSpent = (json['clientTotalSpent'] as num?)?.toDouble()
      ..avgHourlyRatePaid = (json['avgHourlyRatePaid'] as num?)?.toDouble()
      ..includeRisingTalent = json['includeRisingTalent'] as bool?
      ..jobSuccessScore = json['jobSuccessScore'] as String?
      ..location = json['location'] as String?
      ..wttScore = (json['wttScore'] as num?)?.toDouble()
      ..isNew = false;

Map<String, dynamic> _$JobDtoToJson(JobDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'upWorkId': instance.upWorkId,
      'link': instance.link,
      'country': instance.country,
      'priorityCountry': instance.priorityCountry,
      'isForbidden': instance.isForbidden,
      'createdOn': instance.createdOn?.toIso8601String(),
      'category': instance.category,
      'budget': instance.budget,
      'hourlyBudget': instance.hourlyBudget,
      'engagement': instance.engagement,
      'workload': instance.workload,
      'english': instance.english,
      'contractorTier': _$ContractorTierEnumMap[instance.contractorTier],
      'clientScore': instance.clientScore,
      'clientCountFeedback': instance.clientCountFeedback,
      'clientOpenJobs': instance.clientOpenJobs,
      'clientHireRate': instance.clientHireRate,
      'clientJobsPosted': instance.clientJobsPosted,
      'clientTotalSpent': instance.clientTotalSpent,
      'avgHourlyRatePaid': instance.avgHourlyRatePaid,
      'includeRisingTalent': instance.includeRisingTalent,
      'jobSuccessScore': instance.jobSuccessScore,
      'location': instance.location,
      'wttScore': instance.wttScore,
      'history': instance.history,
      'isPriority': instance.isPriority,
      'filterName': instance.filterName,
      'questions': instance.questions,
      'skills': instance.skills,
      'isNew': instance.isNew,
    };

const _$ContractorTierEnumMap = {
  ContractorTier.entryLevel: '0',
  ContractorTier.intermediate: '1',
  ContractorTier.expert: '2',
};
