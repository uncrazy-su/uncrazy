import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:uncrazy/data/note/note.dart';

//This class serves for single note management 

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

Future<bool> updateNote(int id, String title, String desc) async {
  try {
    final response = await client
        .put(Uri.parse('$noteURL/$id'),
            headers: await requestHeaders(),
            body: json.encode({
              'title': title,
              'description': desc,
            }))
        .whenComplete(() => SmartDialog.dismiss());
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

Future<Note> viewNote(int id) async {
  try {
    final response = await client
        .get(Uri.parse('$noteURL/$id'), headers: await requestHeaders())
        .whenComplete(() => SmartDialog.dismiss());
    switch (response.statusCode) {
      case 200:
        return Note.fromJson(jsonDecode(response.body));
      default:
        handleError(response.statusCode);
        return const Note(0, '', '');
    }
  } catch (e) {
    handleUncaughtError();
    return const Note(0, '', '');
  }
}

Future<bool> deleteNote(int id) async {
  try {
    final response = await client
        .delete(
          Uri.parse('$noteURL/$id'),
          headers: await requestHeaders(),
        )
        .whenComplete(() => SmartDialog.dismiss());

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
