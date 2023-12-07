import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uncrazy/screen/add_note/add_note_screen.dart';
import 'package:uncrazy/screen/edit_note/edit_note_screen.dart';
import 'package:uncrazy/screen/edit_task/edit_task_screen.dart';
import 'package:uncrazy/screen/note/note_screen_controller.dart';
import 'package:uncrazy/screen/note/note_screen_model.dart';
import 'package:uncrazy/data/note/note.dart';

// ignore: must_be_immutable
class NoteScreen extends ConsumerWidget {
  final refresher = RefreshController(initialRefresh: true);
  late NoteScreenController noteScreenController;
  late NoteScreenModel model;

  NoteScreen({super.key});
  // List<Note> model = [
  //   Note(
  //       1,
  //       'haloooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo',
  //       'ini desccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc')
  // ];

  @override
  Widget build(BuildContext context, ref) {
    Size screensize = MediaQuery.of(context).size;
    noteScreenController = ref.watch(noteScreenVMProvider.notifier);
    model = ref.watch(noteScreenVMProvider);
    return SmartRefresher(
        controller: refresher,
        onRefresh: () async {
          refresher.headerMode?.value = RefreshStatus.idle;
          await noteScreenController.getNotes();
          refresher.loadComplete();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  color: Colors.transparent,
                  width: screensize.width,
                  child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    children: List.generate(model.notes.length, (index) {
                      return gridNote(context, model.notes[index]);
                    }),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            hoverColor: Colors.blue,
            tooltip: 'add Task',
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: ((context) => AddNoteScreen())))
                  .then((value) => noteScreenController.getNotes());
            },
          ),
        ));
  }

  Container gridNote(BuildContext context, Note note) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        child: Container(
          child: Text(note.title),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddNoteScreen(note))));
        },
      ),
    );
  }
}
