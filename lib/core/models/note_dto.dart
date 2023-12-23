import 'package:json_annotation/json_annotation.dart';

part 'note_dto.g.dart';

@JsonSerializable()
class NoteDto {
  NoteDto(
    this.id,
    this.createdAt,
    this.text,
  );

  factory NoteDto.fromJson(Map<String, dynamic> json) =>
      _$NoteDtoFromJson(json);

  int? id;
  DateTime? createdAt;
  String? text;

  Map<String, dynamic> toJson() => _$NoteDtoToJson(this);
}
