import 'package:json_annotation/json_annotation.dart';

part 'message_dto.g.dart';

@JsonSerializable()
class MessageDto {
  MessageDto(
    this.id,
    this.createdAt,
    this.text,
    this.isOwner,
  );

  factory MessageDto.fromJson(Map<String, dynamic> json) =>
      _$MessageDtoFromJson(json);

  int? id;
  DateTime? createdAt;
  String? text;
  bool? isOwner;

  Map<String, dynamic> toJson() => _$MessageDtoToJson(this);
}
