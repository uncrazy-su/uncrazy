import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uncrazy/data/task/task.dart';
part 'task_screen_model.freezed.dart';
part 'task_screen_model.g.dart';

@freezed
class TaskScreenModel with _$TaskScreenModel{
  const factory TaskScreenModel({
      @Default([]) List<Task> tasks
    })= _TaskScreenModel;

  factory TaskScreenModel.fromJson(Map<String,Object?>json)=>_$TaskScreenModelFromJson(json);
}