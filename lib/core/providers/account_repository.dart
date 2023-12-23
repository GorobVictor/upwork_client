import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:upwork_client/constant.dart';
import 'package:upwork_client/core/core.dart';

class AccountRepository {

  factory AccountRepository() {
    return _repository;
  }

  AccountRepository._internal();
  static final AccountRepository _repository = AccountRepository._internal();

  Future<String?> login(LoginDto model) async {
    final response = await http.post(
      Uri.parse('${Constant.domain}api/Account/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(model),
    );

    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      return json['token'].toString();
    }
    return null;
  }

  Future<bool> checkToken() async {
    final response = await http.get(
      Uri.parse('${Constant.domain}api/Account/CheckToken'),
      headers: <String, String>{
        'Authorization': 'Bearer ${await LocalRepository().getToken()}',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode == 200){
      return true;
    }
    return false;
  }
}
