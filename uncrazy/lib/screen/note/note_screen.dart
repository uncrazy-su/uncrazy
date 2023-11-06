import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:uncrazy/screen/add_note/add_note_screen.dart';
import 'package:uncrazy/screen/note/note_screen_controller.dart';
import 'package:uncrazy/screen/note/note_screen_model.dart';

class NoteScreen extends ConsumerWidget {
  final refresher = RefreshController(initialRefresh: true);
  late NoteScreenController noteScreenController;
  late NoteScreenModel model;

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
                      return gridNote(context, model.notes[index].title, model.notes[index].description);
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: ((context) => AddNoteScreen())));
            },
          ),
        ));
  }

  Container gridNote(BuildContext context, String title, String desc) {
    return Container(
      // width: screensize.width * 0.5,
      // height: screensize.height,
      decoration: BoxDecoration(
        border: Border.all(width: 5, color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        child: Container(
          child: Text(title),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddNoteScreen())));
        },
      ),
    );
  }
}

// return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           leading: IconButton(
//             icon: (Icon(
//               Icons.arrow_back,
//               size: 30,
//             )),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           backgroundColor: Colors.black,
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(15),
//           child: SingleChildScrollView(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'Notes',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 'October, 11th 2023',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   padding: EdgeInsets.all(5),
//                   child: Center(child: Text('Title')),
//                   width: 100,
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20)))),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding:
//                     EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.blue, width: 5),
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 constraints: BoxConstraints(
//                     minWidth: MediaQuery.of(context).size.width,
//                     maxHeight: 50),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   padding: EdgeInsets.all(5),
//                   child: Center(child: Text('Description')),
//                   width: 100,
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20)))),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding:
//                     EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.blue, width: 5),
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 constraints: BoxConstraints(
//                     minWidth: MediaQuery.of(context).size.width,
//                     maxHeight: 200),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                   style: TextButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(30))),
//                     backgroundColor: Colors.blue,
//                     padding:
//                         EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
//                     side: BorderSide(color: Colors.white, width: 1),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     'Done',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                 ))
//             ],
//           )),
//         ));
