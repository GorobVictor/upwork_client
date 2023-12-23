import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:upwork_client/constant.dart';
import 'package:upwork_client/core/core.dart';

class MessageRepository {
  factory MessageRepository() {
    return _repository;
  }

  MessageRepository._internal();

  static final MessageRepository _repository = MessageRepository._internal();

  Future<List<MessageDto>?> getMessages(int skip, int take) async {
    final response = await http.get(
      Uri.parse(
          '${Constant.domain}api/Message/GetMessages?skip=$skip&take=$take'),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      final json = (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      return json.map(MessageDto.fromJson).toList();
    }
    return null;
  }

  Future<List<MessageDto>?> sendMessage(String text) async {
    final response = await http.post(
      Uri.parse('${Constant.domain}api/Message/SendMessage'),
      body: jsonEncode(<String, String>{
        'description': text,
      }),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final list = <MessageDto>[];

      list.add(MessageDto.fromJson(json['request'] as Map<String, dynamic>));
      list.add(MessageDto.fromJson(json['response'] as Map<String, dynamic>));

      return list;
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  Future<bool> deleteMessage(int id) async {
    final response = await http.delete(
      Uri.parse('${Constant.domain}api/Message/DeleteMessage?id=$id'),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  Future<Map<String, String>> getHeaders() async {
    return <String, String>{
      'Authorization': 'Bearer ${await LocalRepository().getToken()}',
      'Content-Type': 'application/json',
    };
  }
}
