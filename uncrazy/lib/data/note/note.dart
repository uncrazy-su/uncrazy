import 'package:freezed_annotation/freezed_annotation.dart';
part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  const factory Note(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'title') String title,
    @JsonKey(name: 'description') String? description
  ) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}

