import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> addTask(String title, String date, String time, String desc,
    int reminder, int tag) async {
  try {
    final response = await client
        .post(Uri.parse(taskURL),
            headers: await requestHeaders(),
            body: json.encode({
              'title': title,
              'date': date,
              'time': time,
              'description': desc,
              'reminder': reminder,
              'tag': tag
            }))
        .whenComplete(() => SmartDialog.dismiss());
    print(response.body);
    switch (response.statusCode) {
      case 200:
        print(response.body);
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

Future<bool> updateTask(int id, String title, String date, String time, String desc,
    int reminder, int tag) async {
  try {
    final response = await client
        .put(Uri.parse('$taskURL/$id'),
            headers: await requestHeaders(),
            body: json.encode({
              'title': title,
              'date': date,
              'time': time,
              'description': desc,
              'reminder': reminder,
              'tag': tag
            }))
        .whenComplete(() => SmartDialog.dismiss());
    print(response.body);
    switch (response.statusCode) {
      case 200:
        print(response.body);
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
