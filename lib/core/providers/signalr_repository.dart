import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:upwork_client/constant.dart';
import 'package:upwork_client/core/core.dart';
import 'package:upwork_client/core/models/job_dto.dart';

class SignalRRepository {
  factory SignalRRepository() {
    return _repository;
  }

  SignalRRepository._internal();

  static final SignalRRepository _repository = SignalRRepository._internal();


}
