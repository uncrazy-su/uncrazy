// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskScreenModel _$TaskScreenModelFromJson(Map<String, dynamic> json) {
  return _TaskScreenModel.fromJson(json);
}

/// @nodoc
mixin _$TaskScreenModel {
  List<Task> get tasks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskScreenModelCopyWith<TaskScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskScreenModelCopyWith<$Res> {
  factory $TaskScreenModelCopyWith(
          TaskScreenModel value, $Res Function(TaskScreenModel) then) =
      _$TaskScreenModelCopyWithImpl<$Res, TaskScreenModel>;
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class _$TaskScreenModelCopyWithImpl<$Res, $Val extends TaskScreenModel>
    implements $TaskScreenModelCopyWith<$Res> {
  _$TaskScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskScreenModelImplCopyWith<$Res>
    implements $TaskScreenModelCopyWith<$Res> {
  factory _$$TaskScreenModelImplCopyWith(_$TaskScreenModelImpl value,
          $Res Function(_$TaskScreenModelImpl) then) =
      __$$TaskScreenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$TaskScreenModelImplCopyWithImpl<$Res>
    extends _$TaskScreenModelCopyWithImpl<$Res, _$TaskScreenModelImpl>
    implements _$$TaskScreenModelImplCopyWith<$Res> {
  __$$TaskScreenModelImplCopyWithImpl(
      _$TaskScreenModelImpl _value, $Res Function(_$TaskScreenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$TaskScreenModelImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskScreenModelImpl implements _TaskScreenModel {
  const _$TaskScreenModelImpl({final List<Task> tasks = const []})
      : _tasks = tasks;

  factory _$TaskScreenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskScreenModelImplFromJson(json);

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskScreenModel(tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskScreenModelImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskScreenModelImplCopyWith<_$TaskScreenModelImpl> get copyWith =>
      __$$TaskScreenModelImplCopyWithImpl<_$TaskScreenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskScreenModelImplToJson(
      this,
    );
  }
}

abstract class _TaskScreenModel implements TaskScreenModel {
  const factory _TaskScreenModel({final List<Task> tasks}) =
      _$TaskScreenModelImpl;

  factory _TaskScreenModel.fromJson(Map<String, dynamic> json) =
      _$TaskScreenModelImpl.fromJson;

  @override
  List<Task> get tasks;
  @override
  @JsonKey(ignore: true)
  _$$TaskScreenModelImplCopyWith<_$TaskScreenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
