import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:uncrazy/widget/loading.dart';

final _client = http.Client();

http.Client get client {
  SmartDialog.showLoading(
//    animationType: SmartAnimationType.scale,
    builder: (context) => CustomCircularProgressIndicator(),
    maskColor: Color.fromARGB(153, 0, 0, 0)
  );
  return _client;
}

Future<Map<String, String>> requestHeaders() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('token') ?? '';
  return {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}

void handleError(int statusCode) {
  String error = '';
  switch (statusCode) {
    case 400:
      error = "Bad Request";
      break;
    case 401:
      error = "Unauthorized";
      break;
    case 403:
      error = "Invalid credentials";
      break;
    case 404:
      error = "Not Found";
      break;
    case 408:
      error = "Connection Timeout";
      break;
    case 500:
      error = "Internal Server Error";
      break;
    default:
      error = "Error occurred while communicating with server";
      break;
  }
  SmartDialog.showToast(error);
}

void responseDialog(String response){
  SmartDialog.showToast(response);
}

void handleUncaughtError() {
  SmartDialog.showToast('Unknown Error');
}




