import 'package:flutter/material.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('Greetings, Everiwan', style: TextStyle(fontSize: 20),)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ],
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [Text('Task')],
                    ),
                    Column(
                      children: [Text('notes')],
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width,
                      maxHeight: 200),
                  child: Column(children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Text('Recent Tasks & Notes'),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))))
                  ]),
                ),
              ],
            )),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(top: 5, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TaskScreen()));
                  },
                  icon: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 40,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.white, size: 40)),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NoteScreen()));
                  },
                  icon: Icon(Icons.note_add_outlined,
                      color: Colors.white, size: 40)),
            ],
          ),
        ));
  }
}
