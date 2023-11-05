import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:day_picker/day_picker.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/widget/collaboration_widget.dart';
import 'package:uncrazy/widget/reminder_widget.dart';
import 'package:uncrazy/widget/repetition_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen> {
  //Value for switch
  bool isSwitchRepetition = false;
  bool isSwitchReminder = false;
  bool isSwitchCollaboration = false;

  int? _value = 1;
  List<String> tag_List = <String>[
    "assignment",
    "event",
    "social",
    "health",
    "class",
    "work",
    "fun"
  ];

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    String date = "November 12, 2023";

    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: false,
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xFF2B2B2B),
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   elevation: 0,
          //   leading: const BackButton(
          //     color: Colors.white,
          //   ),
          // ),
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
                      'Task',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      date,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: screensize.height * 0.02),

                  //Title
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

                  //Date Picker
                  Container(
                    width: 120,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                      child: Center(
                        child: Text(
                          "Date",
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
                  Stack(children: [
                    TextFormField(
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
                    Positioned(
                      top: 5,
                      left: 0,
                      child: IconButton(
                          icon: ImageIcon(
                            AssetImage("assets/images/icon_calender.png"),
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    width: screensize.width,
                                    child: AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: Text("Pick the Date"),
                                      actions: [
                                        Container(
                                          height: 75,
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            initialDateTime:
                                                DateTime(2023, 1, 1),
                                            onDateTimeChanged:
                                                (DateTime newDateTime) {
                                              // Do something
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        SizedBox(
                                          height: 75,
                                          child: CupertinoDatePicker(
                                            initialDateTime: DateTime(00, 00),
                                            mode: CupertinoDatePickerMode.time,
                                            use24hFormat: true,
                                            // This is called when the user changes the time.
                                            onDateTimeChanged:
                                                (DateTime newTime) {
                                              //do something
                                            },
                                          ),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text("Save"))
                                      ],
                                    ),
                                  );
                                });
                          }),
                    ),
                  ]),
                  SizedBox(height: screensize.height * 0.02),

                  // Description
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
                  TextFormField(
                    maxLines: 3,
                    textAlignVertical: TextAlignVertical.top,
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

                  //Repetition
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Repetition",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Switch(
                        value: isSwitchRepetition,
                        onChanged: toggleRepetitionSwitch,
                        activeTrackColor: Colors.orange,
                        activeColor: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: isSwitchRepetition,
                    child: RepetitionWidget(),
                  ),

                  //Reminder
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Reminder",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Switch(
                        value: isSwitchReminder,
                        onChanged: toggleReminderSwitch,
                        activeTrackColor: Colors.orange,
                        activeColor: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: isSwitchReminder,
                    child: Container(
                        height: screensize.width * 0.85,
                        child: ReminderWidget()),
                  ),

                  //Collaboration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Collaboration",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Switch(
                        value: isSwitchCollaboration,
                        onChanged: toggleCollaborationSwitch,
                        activeTrackColor: Colors.orange,
                        activeColor: Colors.deepOrange,
                      ),
                    ],
                  ),
                  Visibility(
                    visible: isSwitchCollaboration,
                    child: Container(
                        height: screensize.width * 0.3,
                        child: CollaborationWidget()),
                  ),

                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      backgroundColor: Colors.blue,
                      side: BorderSide(color: Colors.white, width: 1),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.grey,

                          //action = button change or cancel
                          actions: <Widget>[
                            Wrap(
                              children: List.generate(
                                tag_List.length,
                                (int index) {
                                  // choice chip allow us to
                                  // set its properties.
                                  return ChoiceChip(
                                    label: Text("${tag_List[index]}"),
                                    // color of selected chip
                                    selectedColor: Colors.blue,
                                    // selected chip value
                                    selected: _value == index,
                                    // onselected method
                                    onSelected: (bool selected) {
                                      setState(() {
                                        _value = index;
                                      });
                                    },
                                  );
                                },
                              ).toList(),
                            )
                          ],
                        ),
                      );
                    },
                    child: Text(
                      'Add tag',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
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
              backgroundColor: Colors.orange,
              padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
              side: BorderSide(color: Colors.white, width: 1),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: Colors.black,
                  //title
                  title: Text(
                    "Are you sure to delete?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  //no description

                  //action = button change or cancel
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                      child: const Text(
                        'Delete',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              'Delete Task',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              backgroundColor: Colors.blue,
              padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
              side: BorderSide(color: Colors.white, width: 1),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Save Task',
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

  void toggleRepetitionSwitch(bool value) {
    if (isSwitchRepetition == false) {
      setState(() {
        isSwitchRepetition = true;
      });
    } else {
      setState(() {
        isSwitchRepetition = false;
      });
    }
  }

  void toggleReminderSwitch(bool value) {
    if (isSwitchReminder == false) {
      setState(() {
        isSwitchReminder = true;
      });
    } else {
      setState(() {
        isSwitchReminder = false;
      });
    }
  }

  void toggleCollaborationSwitch(bool value) {
    if (isSwitchCollaboration == false) {
      setState(() {
        isSwitchCollaboration = true;
      });
    } else {
      setState(() {
        isSwitchCollaboration = false;
      });
    }
  }
}
