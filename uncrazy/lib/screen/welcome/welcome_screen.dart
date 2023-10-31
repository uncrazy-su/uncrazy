import 'package:flutter/material.dart';
import 'package:uncrazy/screen/home/homescreen.dart';
import 'package:uncrazy/screen/login/login_screen.dart';
import 'package:uncrazy/screen/register/register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    return Container(
      color: Color(0xFF2B2B2B),
      constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: MediaQuery.of(context).size.height),
      // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Un-CRAZI ",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
              Image.asset("assets/images/logo.png")
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.07,
                left: MediaQuery.of(context).size.width * 0.07),
            child: Text(
              "\"UN-CRAZI YOUR SCHEDULE NOW\"",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.07,
                left: MediaQuery.of(context).size.width * 0.07),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: Colors.blue,
                  minimumSize: Size(MediaQuery.of(context).size.width, 30)),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => LoginScreen())));
              },
              child: Text(
                "Login",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.07,
                left: MediaQuery.of(context).size.width * 0.07),
            child: TextButton(
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  backgroundColor: Colors.blue,
                  minimumSize: Size(MediaQuery.of(context).size.width, 30)),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => RegisterScreen())));
              },
              child: Text(
                "Register",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "|| Un-Crazi @ 2023 ||",
              textAlign: TextAlign.justify,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 10,
                  fontStyle: FontStyle.normal),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05)
        ],
      ),
    );
  }
}

// Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//           padding: EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: 100,
//               ),
//               Text(
//                 'Un-Crazi',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//               Padding(
//                   padding: EdgeInsets.only(left: 20),
//                   child: Text(
//                     '\"Un-Crazi Your Schedule Now!\"',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold),
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton(
                  // style: TextButton.styleFrom(
                  //   shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(30))),
                  //   backgroundColor: Colors.blue,
                  //   padding: EdgeInsets.only(
                  //       left: 100, right: 100, top: 5, bottom: 5),
                  //   //side: BorderSide(color: Colors.white, width: 1),
                  // ),
                  // onPressed: () {
                  //   Navigator.of(context).push(MaterialPageRoute(
                  //       builder: ((context) => LoginScreen())));
                  // },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                   style: TextButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(30))),
//                     backgroundColor: Colors.blue,
//                     padding: EdgeInsets.only(
//                         left: 100, right: 100, top: 5, bottom: 5),
//                     //side: BorderSide(color: Colors.white, width: 1),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: ((context) => RegisterScreen())));
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   )),
//               SizedBox(
//                 height: 20,
//               ),
//             ],
//           )),
//     )
