import 'package:json_annotation/json_annotation.dart';

part 'chat_gpt_history.g.dart';

@JsonSerializable()
class ChatGptHistory {
  bool? isAnswer;
  String? text;

  ChatGptHistory(this.isAnswer,this.text,);

  factory ChatGptHistory.fromJson(Map<String, dynamic> json) => _$ChatGptHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGptHistoryToJson(this);
}