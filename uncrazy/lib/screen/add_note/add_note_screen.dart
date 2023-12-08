import 'package:flutter/material.dart';
import 'package:uncrazy/screen/add_note/add_note_controller.dart';
import 'package:uncrazy/screen/home/homescreen.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/data/note/note.dart';

// ignore: must_be_immutable
class AddNoteScreen extends StatefulWidget {
  Note? note;
  // ignore: use_key_in_widget_constructors
  AddNoteScreen([this.note]);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreen();
}

class _AddNoteScreen extends State<AddNoteScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.note?.title ?? '';
    descController.text = widget.note?.description ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xFF2B2B2B),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screensize.width * 0.05,
                  vertical: screensize.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Note',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: screensize.height * 0.02),
                  Container(
                    width: 120,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: Center(
                        child: Text(
                          "Title",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: titleController,
                    validator: (titleValue) {
                      var passNonNullValue = titleValue ?? "";
                      if (passNonNullValue.isEmpty) {
                        return ("Title cannot be empty");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: screensize.height * 0.02),
                  Container(
                    width: 120,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: Center(
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    width: screensize.width,
                    height: screensize.height * 0.5,
                    child: TextFormField(
                      controller: descController,
                      expands: true,
                      maxLines: null,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomButton(context)),
    );
  }

  Container bottomButton(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              backgroundColor: Colors.blue,
              padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
              side: BorderSide(color: Colors.white, width: 1),
            ),
            onPressed: () async {
              if (widget.note == null) {
                if (await addNote(titleController.text, descController.text)) {
                  Navigator.pop(context);
                }
              } else {
                if (await updateNote(widget.note!.id, titleController.text, descController.text)) {
                  Navigator.pop(context);
                }
              }
            },
            child: Text(
              'Save Note',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}