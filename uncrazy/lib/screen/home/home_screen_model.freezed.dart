// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeScreenModel _$HomeScreenModelFromJson(Map<String, dynamic> json) {
  return _HomeScreenModel.fromJson(json);
}

/// @nodoc
mixin _$HomeScreenModel {
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeScreenModelCopyWith<HomeScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenModelCopyWith<$Res> {
  factory $HomeScreenModelCopyWith(
          HomeScreenModel value, $Res Function(HomeScreenModel) then) =
      _$HomeScreenModelCopyWithImpl<$Res, HomeScreenModel>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$HomeScreenModelCopyWithImpl<$Res, $Val extends HomeScreenModel>
    implements $HomeScreenModelCopyWith<$Res> {
  _$HomeScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeScreenModelImplCopyWith<$Res>
    implements $HomeScreenModelCopyWith<$Res> {
  factory _$$HomeScreenModelImplCopyWith(_$HomeScreenModelImpl value,
          $Res Function(_$HomeScreenModelImpl) then) =
      __$$HomeScreenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$HomeScreenModelImplCopyWithImpl<$Res>
    extends _$HomeScreenModelCopyWithImpl<$Res, _$HomeScreenModelImpl>
    implements _$$HomeScreenModelImplCopyWith<$Res> {
  __$$HomeScreenModelImplCopyWithImpl(
      _$HomeScreenModelImpl _value, $Res Function(_$HomeScreenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$HomeScreenModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeScreenModelImpl implements _HomeScreenModel {
  const _$HomeScreenModelImpl({this.user = const User(0, '', '', '', '')});

  factory _$HomeScreenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeScreenModelImplFromJson(json);

  @override
  @JsonKey()
  final User user;

  @override
  String toString() {
    return 'HomeScreenModel(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeScreenModelImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeScreenModelImplCopyWith<_$HomeScreenModelImpl> get copyWith =>
      __$$HomeScreenModelImplCopyWithImpl<_$HomeScreenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeScreenModelImplToJson(
      this,
    );
  }
}

abstract class _HomeScreenModel implements HomeScreenModel {
  const factory _HomeScreenModel({final User user}) = _$HomeScreenModelImpl;

  factory _HomeScreenModel.fromJson(Map<String, dynamic> json) =
      _$HomeScreenModelImpl.fromJson;

  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$HomeScreenModelImplCopyWith<_$HomeScreenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
