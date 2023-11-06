import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:uncrazy/data/api_response.dart';
import 'package:uncrazy/data/constant.dart';
import 'package:uncrazy/data/note/note.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/screen/note/note_screen_model.dart';

final noteScreenVMProvider =
    StateNotifierProvider<NoteScreenController, NoteScreenModel>(
        (ref) => NoteScreenController());

class NoteScreenController extends StateNotifier<NoteScreenModel> {
  NoteScreenController() : super(const NoteScreenModel());

  Future<void> getNotes() async {
    try {
      final response = await client
          .get(
            Uri.parse(noteURL),
            headers: await requestHeaders(),
          )
          .whenComplete(() => SmartDialog.dismiss());
      print(response.body);
      switch (response.statusCode) {
        case 200:
          print(response.body);
          List<Note> notes = (jsonDecode(response.body) as List<dynamic>)
              .map((e) => Note.fromJson(e))
              .toList();
          state = state.copyWith(notes: notes);

        default:
          handleError(response.statusCode);
      }
    } catch (e) {
      handleUncaughtError();
    }
  }
}
