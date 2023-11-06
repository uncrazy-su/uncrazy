import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/data/task/task.dart';
import 'package:uncrazy/screen/task/task_screen_model.dart';

final taskScreenVMProvider =
    StateNotifierProvider<TaskScreenController, TaskScreenModel>(
        (ref) => TaskScreenController());

class TaskScreenController extends StateNotifier<TaskScreenModel> {
  TaskScreenController() : super(const TaskScreenModel());

  Future<void> getTasks() async {
    try {
      final response = await client
          .get(
            Uri.parse(taskURL),
            headers: await requestHeaders(),
          )
          .whenComplete(() => SmartDialog.dismiss());
      print(response.body);
      switch (response.statusCode) {
        case 200:
          print(response.body);
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
}
