import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:uncrazy/data/task/task.dart';
import 'package:uncrazy/screen/add_task/add_task_controller.dart';
import 'package:uncrazy/widget/collaboration_widget.dart';
import 'package:uncrazy/widget/reminder_widget.dart';
import 'package:uncrazy/widget/repetition_widget.dart';
import 'package:day_picker/day_picker.dart';

// ignore: must_be_immutable
class AddTaskScreen extends StatefulWidget {
  Task? task;
  // ignore: use_key_in_widget_constructors
  AddTaskScreen([this.task]);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen> {
  //Value for switch
  bool isSwitchRepetition = false;
  bool isSwitchReminder = false;
  bool isSwitchCollaboration = false;

  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final descController = TextEditingController();
  final titleController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String datePlease = ' ';
  String timePlease = ' ';

  DateTime datePlease1 = DateTime.now();
  DateTime timePlease1 = DateTime.now();

  final _formKey = GlobalKey<FormState>();

  int tagIndex = -1;

  List<String> tagList = <String>[
    "assignment",
    "event",
    "social",
    "health",
    "class",
    "work",
    "fun"
  ];

  List<int> repetitionDay = [];

  @override
  void initState() {
    titleController.text = widget.task?.title ?? '';
    descController.text = widget.task?.description ?? '';
    dateController.text =
        '${widget.task?.date.toString() ?? ''} ${widget.task?.time.toString() ?? ''}';

    tagIndex = widget.task?.tag ?? -1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

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
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screensize.width * 0.05,
                    vertical: screensize.width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Task',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
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
                      controller: titleController,
                      validator: (titleValue) {
                        var title = titleValue ?? "";
                        if (title.isEmpty) {
                          return ("Title cannot be empty");
                        }
                        return null;
                      },
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
                    SizedBox(height: screensize.height * 0.02),

                    //Date Picker
                    Container(
                      width: 120,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                        child: Center(
                          child: Text(
                            "Date & Time",
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
                    Row(children: [
                      // Date Textformfield
                      Expanded(
                        flex: 7,
                        child: TextFormField(
                          readOnly: true,
                          enableInteractiveSelection: false,
                          controller: dateController,
                          validator: (dateValue) {
                            var date = dateValue ?? "";
                            if (date.toString().length < 2) {
                              return ("Date cannot be empty");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: IconButton(
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
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              initialDateTime: selectedDate,
                                              onDateTimeChanged:
                                                  (DateTime value) {
                                                if (value != null &&
                                                    value != selectedDate)
                                                  setState(() {
                                                    datePlease1 = value;
                                                  });
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 50,
                                          ),
                                          SizedBox(
                                            height: 75,
                                            child: CupertinoDatePicker(
                                              initialDateTime: selectedDate,
                                              mode:
                                                  CupertinoDatePickerMode.time,
                                              use24hFormat: true,
                                              // This is called when the user changes the time.
                                              onDateTimeChanged: (value) {
                                                if (value != null &&
                                                    value != selectedDate)
                                                  setState(() {
                                                    timePlease1 = value;
                                                  });
                                              },
                                            ),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  dateController.text =
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(datePlease1);
                                                  timeController.text =
                                                      DateFormat.Hm()
                                                          .format(timePlease1);
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: const Text("Save"))
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),

                      //Time Textformfield
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          readOnly: true,
                          enableInteractiveSelection: false,
                          controller: timeController,
                          validator: (dateValue) {
                            var date = dateValue ?? "";
                            if (date.toString().length < 2) {}
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "",
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
                      controller: descController,
                      maxLines: 3,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        backgroundColor: Colors.blue,
                        side: BorderSide(color: Colors.white, width: 1),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => StatefulBuilder(
                            builder:
                                (BuildContext context, StateSetter setState) {
                              return AlertDialog(
                                backgroundColor: Colors.grey,
                                actions: <Widget>[
                                  Wrap(
                                    children: List.generate(
                                      tagList.length,
                                      (int index) {
                                        return ChoiceChip(
                                          label: Text(tagList[index]),
                                          selectedColor: Colors.blue,
                                          selected: tagIndex == index,
                                          onSelected: (bool selected) {
                                            setState(() {
                                              tagIndex =
                                                  (selected ? index : null)!;
                                              print(tagIndex);
                                            });
                                          },
                                        );
                                      },
                                    ).toList(),
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      },
                      child: Text(
                        tagIndex==-1 ? 'Add tag': tagIndex.toString(),
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
          ),
          bottomNavigationBar: bottomButton(context)),
    );
  }

  Container bottomButton(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          widget.task != null
              ? TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    backgroundColor: Colors.orange,
                    padding:
                        EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.black,
                        //title
                        title: const Text(
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
                            onPressed: () async {
                              int count = 0;
                              if (await deleteTask(widget.task?.id ?? 0)) {
                                Navigator.of(context)
                                    .popUntil((_) => count++ >= 2);
                              }
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
                )
              : const SizedBox(),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              backgroundColor: Colors.blue,
              padding: EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
              side: BorderSide(color: Colors.white, width: 1),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (widget.task == null) {
                  if (await addTask(
                      titleController.text,
                      dateController.text,
                      timeController.text,
                      descController.text,
                      repetitionDay,
                      0,
                      0)) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                } else {
                  if (await updateTask(
                      widget.task?.id ?? 0,
                      titleController.text,
                      dateController.text,
                      timeController.text,
                      descController.text,
                      0,
                      0)) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                }
              }
            },
            child: const Text(
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

  //Value for switch
  // bool isSwitchRepetition = false;
  // bool isSwitchReminder = false;
  // bool isSwitchCollaboration = false;

  Widget RepetitionWidget() {
    Size screensize = MediaQuery.of(context).size;
    final customWidgetKey = new GlobalKey<SelectWeekDaysState>();

    List<DayInWeek> _days = [
      DayInWeek("Mon", dayKey: "0"),
      DayInWeek("Tue", dayKey: "1"),
      DayInWeek("Wed", dayKey: "2"),
      DayInWeek("Thu", dayKey: "3"),
      DayInWeek("Fri", dayKey: "4"),
      DayInWeek("Sat", dayKey: "5"),
      DayInWeek("Sun", dayKey: "6"),
    ];

    return Container(
      width: screensize.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: SelectWeekDays(
          fontSize: 14,
          backgroundColor: Colors.transparent,
          padding: 0.0,
          days: _days,
          onSelect: (values) {
            List<int> tmp = [];
            (values as List).forEach((element) {
              tmp.add(int.parse(element));
            });
            repetitionDay = tmp;
            print(repetitionDay);
          },
        ),
      ),
    );
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
