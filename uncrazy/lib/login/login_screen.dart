import 'package:flutter/material.dart';
import 'package:uncrazy/home/homescreen/homescreen.dart';

class LoginScreen extends StatelessWidget {
  final emailPhoneController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Welcome Again!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Email/Phone Number',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: emailPhoneController,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Password',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
              SizedBox(
                height: 50,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    backgroundColor: Colors.blue,
                    padding:
                        EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
                    side: BorderSide(color: Colors.white, width: 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          )),
        ));
  }
}
