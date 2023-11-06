import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncrazy/data/user/user.dart';

Future<bool> logout() async {
  try {
      final response = await client
          .post(Uri.parse(signupURL),
              headers: await requestHeaders())
          .whenComplete(() => SmartDialog.dismiss());
      switch (response.statusCode) {
        case 200:
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.remove('token');
          return true;
        default:
            handleError(response.statusCode);
          return false;
      }
    } catch (e) {
      handleUncaughtError();
      return false;
    }
}