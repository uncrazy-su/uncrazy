import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncrazy/data/user/user.dart';

Future<bool> login(String emailPhone, String password) async {
  if (emailPhone.startsWith('0')) {
    try {
      final response = await client
          .post(Uri.parse(loginURL),
              headers: await requestHeaders(),
              body: json.encode({'phone_no': emailPhone, 'password': password}))
          .whenComplete(() => SmartDialog.dismiss());
      switch (response.statusCode) {
        case 200:
          print(response.body);
          String token = response.body;
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('token', token);
          return true;
        default:
          handleError(response.statusCode);
          return false;
      }
    } catch (e) {
      handleUncaughtError();
      return false;
    }
  } else {
    try {
      final response = await client
          .post(Uri.parse(loginURL),
              headers: await requestHeaders(),
              body: json.encode({'email': emailPhone, 'password': password}))
          .whenComplete(() => SmartDialog.dismiss());
      switch (response.statusCode) {
        case 200:
          print(response.body);
          String token = response.body;
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('token', token);
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
}
