import 'package:json_annotation/json_annotation.dart';
import 'package:upwork_client/core/core.dart';

part 'job_dto.g.dart';

@JsonSerializable()
class JobDto {
  JobDto(
    this.id,
    this.title,
    this.description,
    this.upWorkId,
    this.link,
    this.country,
    this.priorityCountry,
    this.isForbidden,
    this.createdOn,
    this.category,
    this.budget,
    this.hourlyBudget,
    this.engagement,
    this.workload,
    this.english,
    this.contractorTier,
    this.clientScore,
    this.clientCountFeedback,
    this.clientOpenJobs,
    this.history,
    this.isPriority,
    this.filterName,
    this.questions,
    this.skills,
  );

  factory JobDto.fromJson(Map<String, dynamic> json) => _$JobDtoFromJson(json);
  int? id;
  String? title;
  String? description;
  String? upWorkId;
  String? link;
  String? country;
  String? priorityCountry;
  bool? isForbidden;
  DateTime? createdOn;
  SingleValueDto? category;
  double? budget;
  HourlyBudgetDto? hourlyBudget;
  SingleValueDto? engagement;
  SingleValueDto? workload;
  SingleValueDto? english;
  ContractorTier? contractorTier;
  double? clientScore;
  int? clientCountFeedback;
  int? clientOpenJobs;

  int? clientHireRate;
  int? clientJobsPosted;
  double? clientTotalSpent;
  double? avgHourlyRatePaid;
  bool? includeRisingTalent;
  String? jobSuccessScore;
  String? location;
  double? wttScore;

  List<ChatGptHistory>? history;
  bool? isPriority;
  String? filterName;
  List<String>? questions;
  List<SkillDto>? skills;
  bool isNew = false;

  Map<String, dynamic> toJson() => _$JobDtoToJson(this);

  String getBudget() {
    var result = budget == null ? hourlyBudget.toString() : budget.toString();
    if (result == 'null') {
      result = '';
    } else {
      result += r' $';
    }
    return result;
  }

  String getContractorTier() {
    return contractorTier.toString().replaceAll('ContractorTier.', '');
  }
}
