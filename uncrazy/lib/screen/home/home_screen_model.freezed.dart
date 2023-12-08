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
  List<Note> get notes => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;
  List<Task> get tasksOverdue => throw _privateConstructorUsedError;

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
  $Res call(
      {User user, List<Note> notes, List<Task> tasks, List<Task> tasksOverdue});

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
    Object? notes = null,
    Object? tasks = null,
    Object? tasksOverdue = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      tasksOverdue: null == tasksOverdue
          ? _value.tasksOverdue
          : tasksOverdue // ignore: cast_nullable_to_non_nullable
              as List<Task>,
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
  $Res call(
      {User user, List<Note> notes, List<Task> tasks, List<Task> tasksOverdue});

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
    Object? notes = null,
    Object? tasks = null,
    Object? tasksOverdue = null,
  }) {
    return _then(_$HomeScreenModelImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      tasksOverdue: null == tasksOverdue
          ? _value._tasksOverdue
          : tasksOverdue // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeScreenModelImpl implements _HomeScreenModel {
  const _$HomeScreenModelImpl(
      {this.user = const User(0, '', '', '', '', ''),
      final List<Note> notes = const [],
      final List<Task> tasks = const [],
      final List<Task> tasksOverdue = const []})
      : _notes = notes,
        _tasks = tasks,
        _tasksOverdue = tasksOverdue;

  factory _$HomeScreenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeScreenModelImplFromJson(json);

  @override
  @JsonKey()
  final User user;
  final List<Note> _notes;
  @override
  @JsonKey()
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<Task> _tasksOverdue;
  @override
  @JsonKey()
  List<Task> get tasksOverdue {
    if (_tasksOverdue is EqualUnmodifiableListView) return _tasksOverdue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasksOverdue);
  }

  @override
  String toString() {
    return 'HomeScreenModel(user: $user, notes: $notes, tasks: $tasks, tasksOverdue: $tasksOverdue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeScreenModelImpl &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._notes, _notes) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._tasksOverdue, _tasksOverdue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_notes),
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_tasksOverdue));

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
  const factory _HomeScreenModel(
      {final User user,
      final List<Note> notes,
      final List<Task> tasks,
      final List<Task> tasksOverdue}) = _$HomeScreenModelImpl;

  factory _HomeScreenModel.fromJson(Map<String, dynamic> json) =
      _$HomeScreenModelImpl.fromJson;

  @override
  User get user;
  @override
  List<Note> get notes;
  @override
  List<Task> get tasks;
  @override
  List<Task> get tasksOverdue;
  @override
  @JsonKey(ignore: true)
  _$$HomeScreenModelImplCopyWith<_$HomeScreenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
