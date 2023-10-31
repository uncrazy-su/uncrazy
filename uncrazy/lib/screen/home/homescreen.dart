import 'package:flutter/material.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xFF2B2B2B),

          //Appbar for the tabbar, welcome message, and profile picture
          appBar: AppBar(
            toolbarHeight: screensize.height * 0.1,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,

            //title = welcome message
            title: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "GREETING, RAISA!",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
            ),

            //action = profile picture to profile setting
            actions: [
              TextButton(
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => ProfileScreen())));
                },
              ),
            ],
          ),

          //body = tabbar
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Container(
                height: screensize.height * 0.04,
                width: screensize.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(
                        width: screensize.width,
                        height: screensize.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 5, 54, 141),
                        ),
                        child: TabBar(
                          indicatorColor: Colors.black,
                          indicator: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(10), // Creates border
                              color: Colors.blue),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Container(
                              child: Text(
                                "Task",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            Container(
                              child: Text(
                                "Notes",
                                style: TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: screensize.height,
                        child: TextButton(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => ProfileScreen())));
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //Tabbar view, view from another screen
              SizedBox(height: screensize.height * 0.01),
              Expanded(
                child: TabBarView(
                  children: [
                    TaskScreen(),
                    NoteScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
