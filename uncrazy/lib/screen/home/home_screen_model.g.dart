// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeScreenModelImpl _$$HomeScreenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeScreenModelImpl(
      user: json['user'] == null
          ? const User(0, '', '', '', '')
          : User.fromJson(json['user'] as Map<String, dynamic>),
      notes: (json['notes'] as List<dynamic>?)
              ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tasks: (json['tasks'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tasksOverdue: (json['tasksOverdue'] as List<dynamic>?)
              ?.map((e) => Task.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HomeScreenModelImplToJson(
        _$HomeScreenModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'notes': instance.notes,
      'tasks': instance.tasks,
      'tasksOverdue': instance.tasksOverdue,
    };
