import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:intl/intl.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> addTask(String title, String date, String time, String desc,
    List<int> repetition, int reminder, int tag) async {
  String inputDate = date; // Replace this with the date you have

  // Parse the input date
  DateTime currentDate = DateFormat("yyyy-MM-dd").parse(inputDate);

  // Find the start and end of the current week
  DateTime startOfWeek =
      currentDate.subtract(Duration(days: currentDate.weekday - 1));
  //DateTime endOfWeek = startOfWeek.add(Duration(days: 6));

  // Print the dates within the same week
  if (repetition.isNotEmpty) {
    for (int i = 0; i < 7; i++) {
      DateTime currentDay = startOfWeek.add(Duration(days: i));
      print(currentDay);
      if (repetition.contains(i)) {
        try {
          //repetition;
          final response = await client
              .post(Uri.parse('$taskURL/create'),
                  headers: await requestHeaders(),
                  body: json.encode({
                    'title': title,
                    'date': DateFormat("yyyy-MM-dd").format(currentDay),
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
    return true;
  } else {
    try {
      //repetition;
      final response = await client
          .post(Uri.parse('$taskURL/create'),
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
  return false;
}

Future<bool> updateTask(int id, String title, String date, String time,
    String desc, int reminder, int tag) async {
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

Future<bool> deleteTask(int id) async {
  try {
    final response = await client
        .delete(
          Uri.parse('$taskURL/$id'),
          headers: await requestHeaders(),
        )
        .whenComplete(() => SmartDialog.dismiss());

    print(response.body);

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
