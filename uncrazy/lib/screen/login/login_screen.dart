import 'package:flutter/material.dart';
import 'package:uncrazy/screen/home/homescreen.dart';
import 'package:uncrazy/screen/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final emailPhoneController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFF2B2B2B),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: screensize.width * 0.1,
                            right: screensize.width * 0.1),
                        child: Image.asset(
                          "assets/images/logo.png",
                          alignment: Alignment.topRight,
                        ))),
                Container(
                    width: screensize.width * 0.7,
                    height: screensize.height * 0.3,
                    decoration: BoxDecoration(
                        color: Color(0xFF3C3C3C),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100),
                            topRight: Radius.circular(100))),
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screensize.width * 0.1,
                      ),
                      child: Text(
                        "Welcome\nBack!",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal),
                      ),
                    )),
                SizedBox(height: screensize.height * 0.08),

                //TextField, butuh validasi
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screensize.width * 0.1),
                  child: TextField(
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: "Email/Phone Number",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),

                SizedBox(height: screensize.height * 0.05),

                //TextField Password, butuh validasi + eye
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screensize.width * 0.1),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "|| Un-Crazi @ 2023 ||",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Colors.black,
                      fontSize: 10,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05)
              ]),
        ));
  }
}


// Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.black,
//         body: Padding(
//           padding: EdgeInsets.only(top: 15, left: 15, right: 15),
//           child: SingleChildScrollView(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               Text(
//                 'Welcome \nBack!',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Text(
//                 'Email/Phone Number',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 style: const TextStyle(color: Colors.white),
//                 controller: emailPhoneController,
//                 decoration: const InputDecoration(
//                     focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue)),
//                     enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue))),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Text(
//                 'Password',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextField(
//                 style: TextStyle(color: Colors.white),
//                 controller: passController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                     focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue)),
//                     enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(color: Colors.blue))),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               TextButton(
//                   style: TextButton.styleFrom(
//                     fixedSize: Size(MediaQuery.of(context).size.width, 40),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(30))),
//                     backgroundColor: Colors.blue,
//                   ),
//                   onPressed: () async {
//                     print(emailPhoneController.text);
//                     if (await login(
//                         emailPhoneController.text, passController.text)) {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => HomeScreen()));
//                     }
//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ))
//             ],
//           )),
//         ));
