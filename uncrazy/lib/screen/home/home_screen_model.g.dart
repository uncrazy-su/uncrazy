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
    );

Map<String, dynamic> _$$HomeScreenModelImplToJson(
        _$HomeScreenModelImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
