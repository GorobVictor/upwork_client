import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:upwork_client/constant.dart';
import 'package:upwork_client/core/core.dart';

class ButtonsRepository {
  factory ButtonsRepository() {
    return _repository;
  }

  ButtonsRepository._internal();

  static final ButtonsRepository _repository = ButtonsRepository._internal();

  Future<String?> getGptAnswer(int jobId) async {
    final response = await http.post(
      Uri.parse('${Constant.domain}api/Buttons/PostFromMobile?jobId=$jobId'),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      final json = (jsonDecode(response.body));
          //.map((e) => e as Map<String, dynamic>);

      return json["message"].toString();
    }
    return null;
  }

  Future<Map<String, String>> getHeaders() async {
    return <String, String>{
      'Authorization': 'Bearer ${await LocalRepository().getToken()}',
    };
  }
}