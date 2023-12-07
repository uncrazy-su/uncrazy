import 'package:flutter/material.dart';
import 'package:uncrazy/screen/add_note/add_note_controller.dart';
import 'package:uncrazy/screen/home/homescreen.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidget();
}

class _SearchWidget extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Container(
      // height: screensize.height * 0.1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Stack(children: [
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
      ),
    );
  }
}
