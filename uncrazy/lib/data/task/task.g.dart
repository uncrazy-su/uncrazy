// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      json['id'] as int,
      json['title'] as String,
      json['date'] as String,
      json['time'] as String,
      json['description'] as String?,
      json['reminder'] as int,
      json['tag'] as int,
      json['status'] as int,
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'time': instance.time,
      'description': instance.description,
      'reminder': instance.reminder,
      'tag': instance.tag,
      'status': instance.status,
    };
