import 'package:flutter/material.dart';
import 'package:upwork_client/app/view/app.dart';

class Constant {
  static String domain = 'https://upwork-web.slackscheduler.pp.ua/';
  static String token = 'token';

  static void showError(Object e) {
    ScaffoldMessenger.of(
      App.navigatorKey.currentState!.context,
    ).showSnackBar(
      SnackBar(
        content: Text(
          'Gpt returns error: $e',
          style: const TextStyle(fontSize: 25),
        ),
        duration: const Duration(seconds: 10),
      ),
    );
  }
}
