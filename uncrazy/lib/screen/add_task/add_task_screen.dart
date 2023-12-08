import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:uncrazy/data/task/task.dart';
import 'package:uncrazy/screen/add_task/add_task_controller.dart';

//This class is for list of tasks management

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
    dateController.text = widget.task?.date.toString() ?? '';
    timeController.text = widget.task?.time.toString() ?? '';

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
          backgroundColor: const Color(0xFF2B2B2B),
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
                                              tagIndex = selected ? index : -1;
                                              print(tagIndex);
                                            });
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    ).toList(),
                                  )
                                ],
                              );
                            },
                          ),
                        ).then((_) => setState(() {}));
                      },
                      child: Text(
                        tagIndex == -1 ? 'Add tag' : '${tagList[tagIndex]}',
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
                  if (await addTask(titleController.text, dateController.text,
                      timeController.text, descController.text, 0, tagIndex)) {
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
                      tagIndex)) {
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
}
