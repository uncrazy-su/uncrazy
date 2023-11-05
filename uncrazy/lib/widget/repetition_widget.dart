import 'package:flutter/material.dart';
import 'package:day_picker/day_picker.dart';
import 'package:uncrazy/screen/note/note_screen.dart';
import 'package:uncrazy/screen/profile/profile_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';
import 'package:uncrazy/screen/task/task_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RepetitionWidget extends StatefulWidget {
  const RepetitionWidget({super.key});

  @override
  State<RepetitionWidget> createState() => _RepetitionWidget();
}

class _RepetitionWidget extends State<RepetitionWidget> {
  //Value for switch
  bool isSwitchRepetition = false;
  bool isSwitchReminder = false;
  bool isSwitchCollaboration = false;

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    final customWidgetKey = new GlobalKey<SelectWeekDaysState>();

    List<DayInWeek> _days = [
      DayInWeek("Mon", dayKey: "monday"),
      DayInWeek("Tue", dayKey: "tuesday"),
      DayInWeek("Wed", dayKey: "wednesday"),
      DayInWeek("Thu", dayKey: "thursday"),
      DayInWeek("Fri", dayKey: "friday"),
      DayInWeek("Sat", dayKey: "saturday"),
      DayInWeek("Sun", dayKey: "sunday"),
    ];

    SelectWeekDays selectWeekDays = SelectWeekDays(
      key: customWidgetKey,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      days: _days,
      border: false,
      width: MediaQuery.of(context).size.width / 1.4,
      boxDecoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30.0),
      ),
      onSelect: (values) {
        print(values);
      },
    );

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
            print(values);
          },
        ),
      ),
    );
  }
}
