import 'package:freezed_annotation/freezed_annotation.dart';
part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'date') String date,
    @JsonKey(name: 'time') String time,
    @JsonKey(name: 'description') String? description,
    //@JsonKey(name: 'repetition') String repetition,
    @JsonKey(name: 'reminder') int reminder,    
    @JsonKey(name: 'tag') int tag,
    @JsonKey(name: 'status') int status,        
  ) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}