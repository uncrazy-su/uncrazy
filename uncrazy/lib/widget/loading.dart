import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/logo.png'), // Replace with your image path
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            strokeWidth: 8,
        ))
      ],
    );
  }
}