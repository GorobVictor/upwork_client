import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:upwork_client/constant.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/core/models/job_dto.dart';

class JobsRepository {
  factory JobsRepository() {
    return _repository;
  }

  JobsRepository._internal();

  static final JobsRepository _repository = JobsRepository._internal();

  Future<List<JobDto>?> getJobs(int skip, int take) async {
    final response = await http.get(
      Uri.parse('${Constant.domain}Job/GetJobs?skip=$skip&take=$take'),
      headers: await getHeaders(),
    );

    if (response.statusCode == 200) {
      final json = (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
      return json.map(JobDto.fromJson).toList();
    }
    return null;
  }

  Future<Map<String, String>> getHeaders() async {
    return <String, String>{
      'Authorization': 'Bearer ${await LocalRepository().getToken()}',
    };
  }
}
