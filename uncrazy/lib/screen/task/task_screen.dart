import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/data/task/task.dart';
import 'package:uncrazy/screen/add_note/add_note_screen.dart';
import 'package:uncrazy/screen/add_task/add_task_controller.dart';
import 'package:uncrazy/screen/add_task/add_task_screen.dart';
import 'package:uncrazy/screen/edit_note/edit_note_screen.dart';
import 'package:uncrazy/screen/edit_task/edit_task_screen.dart';
import 'package:uncrazy/screen/task/task_screen_controller.dart';
import 'package:uncrazy/screen/task/task_screen_model.dart';
import 'package:uncrazy/widget/datePicker_widget.dart';

class TaskScreen extends ConsumerWidget {
  final refresher = RefreshController(initialRefresh: true);
  late TaskScreenController taskScreenController;
  //late TaskScreenModel model;
  List<Task> model = const [
    Task(1, "title", "2023-05-12", "17:30", "description", 1, 1, 0),
    Task(
        2,
        "title2222222222222222222222222222222222222222222222222222222222222222222222222",
        "2023-11-03",
        "17:40",
        "description",
        1,
        1,
        0),
  ];

  final selectedIndexProvider = StateProvider<int>((ref) => 0);

  int _value = 0;
  List<String> tag_List = <String>[
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
  Widget build(BuildContext context, ref) {
    Size screensize = MediaQuery.of(context).size;

    List<String> entries = <String>['Task A', 'Task B', 'Task C'];
    taskScreenController = ref.watch(taskScreenVMProvider.notifier);
    //model = ref.watch(taskScreenVMProvider);

    final selectedIndex = ref.watch(selectedIndexProvider);

    return SmartRefresher(
        controller: refresher,
        onRefresh: () {
          refresher.headerMode?.value = RefreshStatus.idle;
          taskScreenController.getTasks();
          refresher.loadComplete();
        },
        child: Scaffold(
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
                        tag_List.length,
                        (int index) {
                          return ChoiceChip(
                            label: Text("${tag_List[index]}"),
                            selectedColor: Colors.orange,
                            selected: selectedIndex == index,
                            onSelected: (bool selected) {
                              ref.read(selectedIndexProvider.notifier).state =
                                  (selected ? index : null)!;
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  //Today Task
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
                            "  Today  ",
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
                                                mode: CupertinoDatePickerMode
                                                    .date,
                                                initialDateTime: DateTime.now(),
                                                onDateTimeChanged:
                                                    (DateTime newDateTime) {
                                                  // Do something
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50,
                                            ),
                                            TextButton(
                                                onPressed: () {},
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
                        itemCount: model
                            .where((element) => DateTime.parse(element.date)
                                .isBefore(DateTime.now()))
                            .toList()
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          List<Task> todayTask = model
                              .where((element) => DateTime.parse(element.date)
                                  .isBefore(DateTime.now()))
                              .toList();
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditTaskScreen()),
                              );
                            },
                            child: Container(
                              height: 30,
                              child: Row(
                                children: [
                                  CheckboxExample(),
                                  Container(
                                    width: screensize.width * 0.75,
                                    color: Colors.white,
                                    child: Text(
                                      "  " + '${todayTask[index].title}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
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
                        itemCount: model
                            .where((element) => DateTime.parse(element.date)
                                .isBefore(DateTime.now()))
                            // .isBefore(DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()))))
                            .toList()
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          List<Task> overdueTask = model
                              .where((element) => DateTime.parse(element.date)
                                  .isBefore(DateTime.now()))
                              .toList();
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditTaskScreen()),
                              );
                            },
                            child: Container(
                              height: 30,
                              child: Row(
                                children: [
                                  CheckboxExample(),
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
                                          color: Colors.orange,
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
                  .push(MaterialPageRoute(
                      builder: ((context) => AddTaskScreen())))
                  .then((value) => taskScreenController.getTasks());
            },
          ),
        ));
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
        });
      },
    );
  }
}
