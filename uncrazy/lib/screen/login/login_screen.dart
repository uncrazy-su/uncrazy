import 'package:flutter/material.dart';
import 'package:uncrazy/screen/home/homescreen.dart';
import 'package:uncrazy/screen/login/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final emailPhoneController = TextEditingController();
  final passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    RegExp emailPattern = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    RegExp phonePatttern = RegExp(r'^(\+62|62|0)8[1-9][0-9]{6,9}$');

    RegExp passPattern =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    return SafeArea(
      child: Scaffold(
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
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
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
                        height: screensize.height * 0.2,
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
                    SizedBox(height: screensize.height * 0.05),

                    //Email Phone
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screensize.width * 0.1),
                      child: TextFormField(
                        controller: emailPhoneController,
                        validator: (emailPhoneController) {
                          var nonNullValue = emailPhoneController ?? '';
                          if (nonNullValue.isEmpty) {
                            return ("Email/Phone Number is required");
                          }
                          if (!emailPattern.hasMatch(nonNullValue) &&
                              !phonePatttern.hasMatch(nonNullValue)) {
                            return ("Please enter valid email/phone number");
                          }
                          // if (!phonePatttern.hasMatch(nonNullValue)) {
                          //   return ("Please enter valid email/phone number");
                          // }
                          return null;
                        },
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
                      padding: EdgeInsets.symmetric(
                          horizontal: screensize.width * 0.1),
                      child: TextFormField(
                        obscureText: true,
                        controller: passController,
                        validator: (PassCurrentValue) {
                          var passNonNullValue = PassCurrentValue ?? "";
                          if (passNonNullValue.isEmpty) {
                            return ("Password is required");
                          } else if (passNonNullValue.length < 6) {
                            return ("Password Must be more than 5 characters");
                          } 
                          // else if (!passPattern.hasMatch(passNonNullValue)) {
                          //   return ("Password should contain upper,lower,digit and Special character ");
                          // }
                          return null;
                        },
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

                    //button
                    SizedBox(height: screensize.height * 0.1),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screensize.width * 0.1),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            backgroundColor: Colors.blue,
                            minimumSize:
                                Size(MediaQuery.of(context).size.width, 30)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (await login(
                                emailPhoneController.text,
                                passController.text)) {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                  builder: (_) => HomeScreen()), (route) => false);
                            }                          }

                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: ((context) => HomeScreen())));
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
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ),
          )),
    );
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
