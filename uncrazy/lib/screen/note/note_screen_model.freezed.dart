// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_screen_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NoteScreenModel _$NoteScreenModelFromJson(Map<String, dynamic> json) {
  return _NoteScreenModel.fromJson(json);
}

/// @nodoc
mixin _$NoteScreenModel {
  List<Note> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NoteScreenModelCopyWith<NoteScreenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteScreenModelCopyWith<$Res> {
  factory $NoteScreenModelCopyWith(
          NoteScreenModel value, $Res Function(NoteScreenModel) then) =
      _$NoteScreenModelCopyWithImpl<$Res, NoteScreenModel>;
  @useResult
  $Res call({List<Note> notes});
}

/// @nodoc
class _$NoteScreenModelCopyWithImpl<$Res, $Val extends NoteScreenModel>
    implements $NoteScreenModelCopyWith<$Res> {
  _$NoteScreenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteScreenModelImplCopyWith<$Res>
    implements $NoteScreenModelCopyWith<$Res> {
  factory _$$NoteScreenModelImplCopyWith(_$NoteScreenModelImpl value,
          $Res Function(_$NoteScreenModelImpl) then) =
      __$$NoteScreenModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Note> notes});
}

/// @nodoc
class __$$NoteScreenModelImplCopyWithImpl<$Res>
    extends _$NoteScreenModelCopyWithImpl<$Res, _$NoteScreenModelImpl>
    implements _$$NoteScreenModelImplCopyWith<$Res> {
  __$$NoteScreenModelImplCopyWithImpl(
      _$NoteScreenModelImpl _value, $Res Function(_$NoteScreenModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notes = null,
  }) {
    return _then(_$NoteScreenModelImpl(
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NoteScreenModelImpl implements _NoteScreenModel {
  const _$NoteScreenModelImpl({final List<Note> notes = const []})
      : _notes = notes;

  factory _$NoteScreenModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NoteScreenModelImplFromJson(json);

  final List<Note> _notes;
  @override
  @JsonKey()
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'NoteScreenModel(notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteScreenModelImpl &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteScreenModelImplCopyWith<_$NoteScreenModelImpl> get copyWith =>
      __$$NoteScreenModelImplCopyWithImpl<_$NoteScreenModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NoteScreenModelImplToJson(
      this,
    );
  }
}

abstract class _NoteScreenModel implements NoteScreenModel {
  const factory _NoteScreenModel({final List<Note> notes}) =
      _$NoteScreenModelImpl;

  factory _NoteScreenModel.fromJson(Map<String, dynamic> json) =
      _$NoteScreenModelImpl.fromJson;

  @override
  List<Note> get notes;
  @override
  @JsonKey(ignore: true)
  _$$NoteScreenModelImplCopyWith<_$NoteScreenModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
