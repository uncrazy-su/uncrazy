import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uncrazy/data/note/note.dart';
import 'package:uncrazy/data/task/task.dart';
import 'package:uncrazy/data/user/user.dart';
part 'home_screen_model.freezed.dart';
part 'home_screen_model.g.dart';

//This class serves for homeScreenModel
@freezed
class HomeScreenModel with _$HomeScreenModel{
  const factory HomeScreenModel({
        @Default(User(0, '', '', '', '', '')) User user,
        @Default([]) List<Note> notes,
        @Default([]) List<Task> tasks,
        @Default([]) List<Task> tasksOverdue,

    })= _HomeScreenModel;

  factory HomeScreenModel.fromJson(Map<String,Object?>json)=>_$HomeScreenModelFromJson(json);
}