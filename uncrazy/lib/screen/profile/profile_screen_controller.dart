import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uncrazy/data/user/user.dart';

Future<bool> updateUser(int paramType, String updatedParam) async {
  try {
    final response = await client
        .put(
          Uri.parse(userURL),
          headers: await requestHeaders(),
           body: //paramType == 1?
               json.encode({'name': updatedParam})
          // : paramType == 2
          //     ? json.encode({'phone_no': updatedParam})
          //     : paramType == 3
          //         ? json.encode({'email': updatedParam})
          //         : json.encode({'password': updatedParam}
        )
        .whenComplete(() => SmartDialog.dismiss());
    SmartDialog.showToast(response.body);
    switch (response.statusCode) {
      case 200:
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

Future<bool> logout() async {
  try {
    final response = await client
        .post(Uri.parse(logoutURL), headers: await requestHeaders())
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
