import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReminderWidget extends StatefulWidget {
  const ReminderWidget({super.key});

  @override
  State<ReminderWidget> createState() => _ReminderWidget();
}

enum reminder { a, b, c, d, e, f }

reminder? _reminder = reminder.a;

class _ReminderWidget extends State<ReminderWidget> {
  //Value for switch
  bool isSwitchRepetition = false;
  bool isSwitchReminder = false;
  bool isSwitchCollaboration = false;

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Container(
      width: screensize.width,
      child: ListView(
        children: <Widget>[
          RadioListTile<reminder>(
            title: const Text(
              '5 Minutes before',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            value: reminder.a,
            groupValue: _reminder,
            onChanged: (reminder? value) {
              setState(() {
                _reminder = value;
              });
            },
          ),
          RadioListTile<reminder>(
            title: const Text(
              '10 Minutes before',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            value: reminder.b,
            groupValue: _reminder,
            onChanged: (reminder? value) {
              setState(() {
                _reminder = value;
              });
            },
          ),
          RadioListTile<reminder>(
            title: const Text(
              '15 Minutes before',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            value: reminder.c,
            groupValue: _reminder,
            onChanged: (reminder? value) {
              setState(() {
                _reminder = value;
              });
            },
          ),
          RadioListTile<reminder>(
            title: const Text(
              '20 Minutes before',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            value: reminder.d,
            groupValue: _reminder,
            onChanged: (reminder? value) {
              setState(() {
                _reminder = value;
              });
            },
          ),
          RadioListTile<reminder>(
            title: const Text(
              '25 Minutes before',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            value: reminder.e,
            groupValue: _reminder,
            onChanged: (reminder? value) {
              setState(() {
                _reminder = value;
              });
            },
          ),
          RadioListTile<reminder>(
            title: const Text(
              '30 Minutes before',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            value: reminder.f,
            groupValue: _reminder,
            onChanged: (reminder? value) {
              setState(() {
                _reminder = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
