import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/data/task/task.dart';
import 'package:uncrazy/screen/add_task/add_task_screen.dart';
import 'package:uncrazy/screen/home/home_screen_controller.dart';
import 'package:uncrazy/screen/home/home_screen_model.dart';
import 'package:uncrazy/screen/home/homescreen.dart';

// ignore: must_be_immutable
class TaskScreen extends ConsumerStatefulWidget {
  HomeScreenController taskScreenController;
  Function onDateChange;
  TaskScreen(
      {super.key,
      required this.taskScreenController,
      required this.onDateChange});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskScreen();
}

class _TaskScreen extends ConsumerState<TaskScreen> {
  late HomeScreenModel model;

  int selectedIndex = 0;
  DateTime pickedDate = DateTime.now();

  List<String> tagList = <String>[
    "all",
    "assignment",
    "event",
    "social",
    "health",
    "class",
    "work",
    "fun"
  ];

  @override
  void initState() {
    super.initState();
    widget.taskScreenController
        .getTasksByDate(DateFormat('yyyy-MM-dd').format(pickedDate));
    widget.taskScreenController
        .getTasksOverdue(DateFormat('yyyy-MM-dd').format(pickedDate));
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    model = ref.watch(homeScreenVMProvider);

    final taskContainerText = ref.watch(sharedDataProvider).data;
    print(taskContainerText);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
          child: SafeArea(
        //The start
        child: Container(
          width: screensize.width,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    tagList.length,
                    (int index) {
                      return ChoiceChip(
                        label: Text(tagList[index]),
                        selectedColor: Colors.orange,
                        selected: selectedIndex == index,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedIndex = (selected ? index : null)!;
                            if (selected) {
                              print(index);
                              widget.taskScreenController
                                  .getTasksByDate(DateFormat('yyyy-MM-dd')
                                      .format(pickedDate))
                                  .then((value) => widget.taskScreenController
                                      .filterByTag(index));
                            }
                          });
                          // ref.read(selectedIndexProvider.notifier).state =
                          //     (selected ? index : null)!;
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              //Today Task
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: screensize.width,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        taskContainerText == 0
                            ? DateFormat('yyyy-MM-dd').format(pickedDate) ==
                                    DateFormat('yyyy-MM-dd')
                                        .format(DateTime.now())
                                ? "  Today  "
                                : "  " +
                                    DateFormat('yyyy-MM-dd').format(pickedDate)
                            : '  Search   ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          icon: ImageIcon(
                            AssetImage("assets/images/icon_calender.png"),
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {
                            showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  DateTime tmp = pickedDate;
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
                                            initialDateTime: DateTime.now(),
                                            onDateTimeChanged:
                                                (DateTime newDateTime) {
                                              // Do something
                                              setState(() {
                                                tmp = newDateTime;
                                              });
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                pickedDate = tmp;
                                              });
                                              widget.onDateChange(tmp);
                                              widget.taskScreenController
                                                  .getTasksByDate(
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(pickedDate))
                                                  .then((value) =>
                                                      Navigator.pop(context));
                                            },
                                            child: const Text("Save"))
                                      ],
                                    ),
                                  );
                                });
                          })
                    ],
                  ),
                ),
              ),
              //Container Today's Task
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: screensize.width,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListView.separated(
                    itemCount: model.tasks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddTaskScreen(model.tasks[index])),
                          ).then((value) => widget.taskScreenController
                              .getTasksByDate(DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now())));
                        },
                        child: Container(
                          height: 30,
                          child: Row(
                            children: [
                              //CheckboxExample(),
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: const Color.fromRGBO(0, 0, 0, 1),
                                // fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: model.tasks[index].status == 0
                                    ? false
                                    : true,
                                onChanged: (value) {
                                  //setState(() {
                                  widget.taskScreenController.updateTaskStatus(
                                      model.tasks[index].id, value! ? 1 : 0);
                                  widget.taskScreenController.getTasksByDate(
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate));
                                  // isChecked = value!;
                                  //    if (isChecked) {}
                                  //});
                                },
                              ),

                              Container(
                                width: screensize.width * 0.75,
                                color: Colors.white,
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                      "  " '${model.tasks[index].title}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${model.tasks[index].time}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          // child: Center(child: Text('Entry ${entries[index]}')),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                  ),
                ),
              ),

              // Overdue Task
              SizedBox(height: screensize.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: screensize.width,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "  Overdue  ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Overdue tasklist
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: screensize.width,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListView.separated(
                    itemCount: model.tasksOverdue.length,
                    itemBuilder: (BuildContext context, int index) {
                      List<Task> overdueTask = model.tasksOverdue.toList();
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddTaskScreen(model.tasksOverdue[index])),
                          );
                        },
                        child: Container(
                          height: 30,
                          child: Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                activeColor: const Color.fromRGBO(0, 0, 0, 1),
                                // fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: model.tasksOverdue[index].status == 0
                                    ? false
                                    : true,
                                onChanged: (value) {
                                  //setState(() {
                                  widget.taskScreenController.updateTaskStatus(
                                      model.tasksOverdue[index].id,
                                      value! ? 1 : 0);
                                  widget.taskScreenController.getTasksOverdue(
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate));
                                  // isChecked = value!;
                                  //    if (isChecked) {}
                                  //});
                                },
                              ),
                              Container(
                                width: screensize.width * 0.75,
                                color: Colors.white,
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 8,
                                    child: Text(
                                      "  " + '${overdueTask[index].title}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${overdueTask[index].date}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
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
              .push(MaterialPageRoute(builder: ((context) => AddTaskScreen())))
              .then((value) => widget.taskScreenController.getTasksByDate(
                  DateFormat('yyyy-MM-dd').format(DateTime.now())));
        },
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxStateExample();
}

class _CheckboxStateExample extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.white;
    }

    return Checkbox(
      checkColor: Colors.white,
      activeColor: const Color.fromRGBO(0, 0, 0, 1),
      // fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
          if (isChecked) {}
        });
      },
    );
  }
}
