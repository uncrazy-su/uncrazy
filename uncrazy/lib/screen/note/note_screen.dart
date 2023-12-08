import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uncrazy/screen/add_note/add_note_screen.dart';
import 'package:uncrazy/screen/home/home_screen_controller.dart';
import 'package:uncrazy/screen/home/home_screen_model.dart';
import 'package:uncrazy/data/note/note.dart';

// ignore: must_be_immutable
class NoteScreen extends ConsumerStatefulWidget {
  HomeScreenController noteScreenController;
  NoteScreen({super.key, required this.noteScreenController});

  @override
  ConsumerState<NoteScreen> createState() => _NoteScreen();
}

class _NoteScreen extends ConsumerState<NoteScreen> {
  late HomeScreenModel model;

  @override
  void initState() {
    widget.noteScreenController.getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    model = ref.watch(homeScreenVMProvider);
    return Scaffold(
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
              .push(MaterialPageRoute(builder: ((context) => AddNoteScreen())))
              .then((value) => widget.noteScreenController.getNotes());
        },
      ),
    );
  }

  Widget gridNote(BuildContext context, Note note) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
                MaterialPageRoute(builder: ((context) => AddNoteScreen(note))))
            .then((value) => widget.noteScreenController.getNotes());
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                note.title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.combine([
                      TextDecoration.underline,
                      TextDecoration.overline,
                    ]),
                    decorationStyle: TextDecorationStyle.dashed),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                " ",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Text(
                note.description ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}


// return Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 5, color: Colors.grey),
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: TextButton(
//         child: Container(
//           child: Text(note.title),
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//         ),
//         onPressed: () {
//           print(note.title);
//           Navigator.of(context)
//               .push(MaterialPageRoute(
//                   builder: ((context) => AddNoteScreen(note))))
//               .then((value) => widget.noteScreenController.getNotes());
//         },
//       ),
//     );