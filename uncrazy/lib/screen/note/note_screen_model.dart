import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uncrazy/data/note/note.dart';
part 'note_screen_model.freezed.dart';
part 'note_screen_model.g.dart';

@freezed
class NoteScreenModel with _$NoteScreenModel{
  const factory NoteScreenModel({
      @Default([]) List<Note> notes
    })= _NoteScreenModel;

  factory NoteScreenModel.fromJson(Map<String,Object?>json)=>_$NoteScreenModelFromJson(json);
}