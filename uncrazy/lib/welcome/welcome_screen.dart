import 'package:flutter/material.dart';
import 'package:uncrazy/home/homescreen/homescreen.dart';
import 'package:uncrazy/login/login_screen.dart';
import 'package:uncrazy/register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
              ),
              Text(
                'Un-Crazi',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Un-Crazi Your Schedule Now!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.only(
                        left: 100, right: 100, top: 5, bottom: 5),
                    //side: BorderSide(color: Colors.white, width: 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => LoginScreen())));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        //side: BorderSide(color: Colors.white, width: 1),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => RegisterScreen())));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                  TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        //side: BorderSide(color: Colors.white, width: 1),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => HomeScreen())));
                      },
                      child: Text(
                        'Offline Mode',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}
