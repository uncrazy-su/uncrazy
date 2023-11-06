// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteScreenModelImpl _$$NoteScreenModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NoteScreenModelImpl(
      notes: (json['notes'] as List<dynamic>?)
              ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$NoteScreenModelImplToJson(
        _$NoteScreenModelImpl instance) =>
    <String, dynamic>{
      'notes': instance.notes,
    };
