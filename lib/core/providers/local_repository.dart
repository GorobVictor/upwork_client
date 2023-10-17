import 'package:shared_preferences/shared_preferences.dart';
import 'package:upwork_client/constant.dart';

class LocalRepository{

  factory LocalRepository() {
    return _repository;
  }

  LocalRepository._internal();
  final Future<SharedPreferences> _sharedPreferences = SharedPreferences.getInstance();
  static final LocalRepository _repository = LocalRepository._internal();

  Future<void> saveToken(String token) async{
    final share = await _sharedPreferences;

    await share.setString(Constant.token, token);
  }

  Future<String?> getToken() async{
    final share = await _sharedPreferences;

    return share.getString(Constant.token);
  }
}