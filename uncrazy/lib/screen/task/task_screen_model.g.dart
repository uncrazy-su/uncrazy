// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskScreenModelImpl _$$TaskScreenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TaskScreenModelImpl(
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TaskScreenModelImplToJson(
        _$TaskScreenModelImpl instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
    };
