import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> addNote(String title, String desc) async {
  try {
    final response = await client
        .post(Uri.parse(noteURL),
            headers: await requestHeaders(),
            body: json.encode({
              'title': title,
              'description': desc,
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
