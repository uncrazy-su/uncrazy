import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:uncrazy/data/note/note.dart';
import 'package:uncrazy/data/task/task.dart';
import 'package:uncrazy/data/user/user.dart';
import 'package:uncrazy/screen/home/home_screen_model.dart';

final homeScreenVMProvider =
    StateNotifierProvider<HomeScreenController, HomeScreenModel>(
        (ref) => HomeScreenController());

class HomeScreenController extends StateNotifier<HomeScreenModel> {
  HomeScreenController() : super(const HomeScreenModel());

  Future<void> getProfile() async {
    try {
      final response = await client
          .get(Uri.parse(userURL), headers: await requestHeaders())
          .whenComplete(() => SmartDialog.dismiss());
      switch (response.statusCode) {
        case 200:
          print(response.body);
          User user = User.fromJson(jsonDecode(response.body));
          state = state.copyWith(user: user);
          break;
        default:
          handleError(response.statusCode);
          break;
      }
    } catch (e) {
      handleUncaughtError();
    }
  }

  Future<void> getNotes() async {
    try {
      final response = await client
          .get(
            Uri.parse(noteURL),
            headers: await requestHeaders(),
          )
          .whenComplete(() => SmartDialog.dismiss());
      print(response.body);
      switch (response.statusCode) {
        case 200:
          //print(response.body);
          List<Note> notes = (jsonDecode(response.body) as List<dynamic>)
              .map((e) => Note.fromJson(e))
              .toList();
          state = state.copyWith(notes: notes);

        default:
          handleError(response.statusCode);
      }
    } catch (e) {
      handleUncaughtError();
    }
  }

  Future<bool> getTasksByDate(String date) async {
    try {
      final response = await client
          .post(Uri.parse(taskURL),
              headers: await requestHeaders(),
              body: json.encode({
                'date': date}))
          .whenComplete(() => SmartDialog.dismiss());
      print(response.body);
      switch (response.statusCode) {
        case 200:
          //print(response.body);
          List<Task> tasks = (jsonDecode(response.body) as List<dynamic>)
              .map((e) => Task.fromJson(e))
              .toList();
          state = state.copyWith(tasks: tasks);
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

  Future<bool> getTasksOverdue(String date) async {
    try {
      final response = await client
          .post(Uri.parse('$taskURL/overdue'),
              headers: await requestHeaders(),
              body: json.encode({'date': date}))
          .whenComplete(() => SmartDialog.dismiss());
      print(response.body);
      switch (response.statusCode) {
        case 200:
          //print(response.body);
          List<Task> tasks = (jsonDecode(response.body) as List<dynamic>)
              .map((e) => Task.fromJson(e))
              .toList();
          state = state.copyWith(tasksOverdue: tasks);
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

  Future<bool> updateTaskStatus(int id, int status) async {
    try {
      final response = await client
          .put(Uri.parse('$taskURL/$id'),
              headers: await requestHeaders(),
              body: json.encode({'status': status}))
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

Future<bool> deleteDoneTask() async {
  try {
    final response = await client
        .delete(
          Uri.parse('$taskURL/delete'),
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

  Future<void> searchTask(String title) async{
    try {
      final response = await client
          .post(Uri.parse('$taskURL/search'),
              headers: await requestHeaders(),
              body: json.encode({'title': title}))
          .whenComplete(() => SmartDialog.dismiss());
      print(response.body);
      switch (response.statusCode) {
        case 200:
          //print(response.body);
          List<Task> tasks = (jsonDecode(response.body) as List<dynamic>)
              .map((e) => Task.fromJson(e))
              .toList();
          state = state.copyWith(tasks: tasks);
        default:
          handleError(response.statusCode);
      }
    } catch (e) {
      handleUncaughtError();
    }    
  }

    Future<void> searchNote(String title) async{
    try {
      final response = await client
          .post(Uri.parse('$noteURL/search'),
              headers: await requestHeaders(),
              body: json.encode({'title': title}))
          .whenComplete(() => SmartDialog.dismiss());
      print(response.body);
      switch (response.statusCode) {
        case 200:
          //print(response.body);
          List<Note> notes = (jsonDecode(response.body) as List<dynamic>)
              .map((e) => Note.fromJson(e))
              .toList();
          state = state.copyWith(notes: notes);
        default:
          handleError(response.statusCode);
      }
    } catch (e) {
      handleUncaughtError();
    }    
  }

  // void search(String key) {
  //   key = key.toLowerCase();
  //   List<Task> tmp = state.tasks.where((element) {
  //     var title = element.title.toLowerCase();
  //     return title.contains(key);
  //   }).toList();
  //   state = state.copyWith(tasks: tmp);
  // }

  void filterByTag(int key) {
    if (key != 0) {
      List<Task> tmp =
          state.tasks.where((element) => element.tag == key-1).toList();
      state = state.copyWith(tasks: tmp);
    }
  }
}

