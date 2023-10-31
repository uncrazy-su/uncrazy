import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    List<String> entries = <String>['Task A', 'Task B', 'Task C'];

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
                          onPressed: () {})
                    ],
                  ),
                ),
              ),
              //Container Today's Task
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: screensize.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 30,
                        child: Row(
                          children: [
                            CheckboxExample(),
                            Container(
                              width: screensize.width * 0.75,
                              color: Colors.white,
                              child: Text(
                                '${entries[index]}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // child: Center(child: Text('Entry ${entries[index]}')),
                      );
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
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 30,
                        child: Row(
                          children: [
                            CheckboxExample(),
                            Container(
                              width: screensize.width * 0.75,
                              color: Colors.white,
                              child: Text(
                                '${entries[index]}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              //collaboration task
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
                        "  Collaboration  ",
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
              // Collaboration tasklist
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: screensize.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 30,
                        child: Row(
                          children: [
                            CheckboxExample(),
                            Container(
                              width: screensize.width * 0.75,
                              color: Colors.white,
                              child: Text(
                                '${entries[index]}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
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
        onPressed: () {},
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
        });
      },
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
//                 'Task',
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
//                     maxHeight: 100),
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
//                     maxHeight: 150),
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
//                   ))
//             ],
//           )),
//         ));
