import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:uncrazy/data/user/user.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

Future<bool> register(String name, String emailPhone, String password) async {
  String email;
  String phone;

  print(name);

  if (emailPhone.startsWith('0')) {
    phone = emailPhone;
    try {
      final response = await client
          .post(Uri.parse(signupURL),
              headers: await requestHeaders(),
              body: json.encode(
                  {'name': name, 'phone_no': phone, 'password': password}))
          .whenComplete(() => SmartDialog.dismiss());
      switch (response.statusCode) {
        case 200:
          print(response.body);
          String token = response.body;
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('token', token);
          return true;
        default:
          if (response.body.contains('message')) {
            SmartDialog.showToast(jsonDecode(response.body)['message']);
          } else {
            handleError(response.statusCode);
          }
          return false;
      }
    } catch (e) {
      print(e);
      handleUncaughtError();
      return false;
    }
  } else {
    email = emailPhone;
    try {
      final response = await client
          .post(Uri.parse(signupURL),
              headers: await requestHeaders(),
              body: json
                  .encode({'name': name, 'email': email, 'password': password}))
          .whenComplete(() => SmartDialog.dismiss());
      switch (response.statusCode) {
        case 200:
          String token = response.body;
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('token', token);
          return true;
        default:
          if (response.body.contains('message')) {
            SmartDialog.showToast(jsonDecode(response.body)['message']);
          } else {
            handleError(response.statusCode);
          }
          return false;
      }
    } catch (e) {
      handleUncaughtError();
      return false;
    }
  }
}
