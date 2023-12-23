import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:upwork_client/constant.dart';
import 'package:upwork_client/core/core.dart';

class NoteRepository {
  factory NoteRepository() {
    return _repository;
  }

  NoteRepository._internal();

  static final NoteRepository _repository = NoteRepository._internal();

  Future<List<NoteDto>?> getNotes(int skip, int take) async {
    final response = await http.get(
      Uri.parse('${Constant.domain}api/Note/GetNotes?skip=$skip&take=$take'),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      final json = (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      return json.map(NoteDto.fromJson).toList();
    }
    return null;
  }

  Future<NoteDto?> sendNote(String text) async {

    final response = await http.post(
      Uri.parse('${Constant.domain}api/Note/SendNote'),
      body: jsonEncode(<String, String>{
        'text': text,
      }),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return NoteDto.fromJson(json as Map<String, dynamic>);
    } else {
      throw Exception('${response.statusCode}');
    }
  }

  Future<bool> deleteNote(int id) async {
    final response = await http.delete(
      Uri.parse('${Constant.domain}api/Note/DeleteNote?id=$id'),
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
