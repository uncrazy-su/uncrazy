import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CollaborationWidget extends StatefulWidget {
  const CollaborationWidget({super.key});

  @override
  State<CollaborationWidget> createState() => _CollaborationWidget();
}

class _CollaborationWidget extends State<CollaborationWidget> {
  //Value for switch
  bool isSwitchRepetition = false;
  bool isSwitchReminder = false;
  bool isSwitchCollaboration = false;

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    final customWidgetKey = new GlobalKey<SelectWeekDaysState>();

    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search"),
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Positioned(
                right: 0,
                top: 5,
                child: IconButton(
                    icon: Icon(
                      Icons.search_rounded,
                      color: Colors.black,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ]),
            TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                backgroundColor: Colors.blue,
                side: BorderSide(color: Colors.white, width: 1),
              ),
              onPressed: () {},
              child: Text(
                'Add Person',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
    );
  }
}
