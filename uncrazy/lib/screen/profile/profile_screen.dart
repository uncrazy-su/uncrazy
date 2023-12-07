import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uncrazy/data/user/user.dart';
import 'package:uncrazy/screen/profile/profile_screen_controller.dart';
import 'package:uncrazy/screen/welcome/welcome_screen.dart';

/*Problem with profile screen:
  - Change photo profile not yet implemented
  - Cannot change the username by the change button (dont know how to implement this)
*/

class ProfileScreen extends StatefulWidget {
  User user;
  ProfileScreen(this.user);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final emailPhoneController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  String nameString = " ";
  String emailPhoneString = " ";
  String passString = " ";

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    emailPhoneController.text = widget.user.email ?? widget.user.phone_no ?? '';
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    RegExp emailPattern = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    RegExp phonePatttern = RegExp(r'^(\+62|62|0)8[1-9][0-9]{6,9}$');

    RegExp passPattern =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    return Scaffold(
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
          child: Container(
            width: screensize.width,
            child: Padding(
              padding: EdgeInsets.only(
                  left: screensize.width * 0.1,
                  right: screensize.width * 0.1,
                  top: screensize.height * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Profile picture
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(250),
                          border: Border.all(color: Colors.black, width: 5),
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 25,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: <Widget>[
                      //Username
                      Stack(
                        children: <Widget>[
                          TextFormField(
                            controller: nameController,
                            readOnly: true,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)),
                              labelText: "Username",
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.black,
                                    //title = what do you change
                                    title: Text(
                                      "Change Username: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    //content = TextFormField to change the username
                                    content: TextFormField(
                                      controller: nameController,
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                      ),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    //action = button change or cancel
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          //setState(() {
                                          nameString = nameController.text;
                                          Navigator.pop(context);
                                          //});
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          if (await updateUser(
                                              1, nameController.text)) {
                                            Navigator.pop(context, 'Change');
                                          }
                                        },
                                        child: const Text('Change'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screensize.height * 0.05),

                      //Email/Phone Number
                      Stack(
                        children: <Widget>[
                          TextFormField(
                            // initialValue: "email@mail.com",
                            readOnly: true,
                            controller: emailPhoneController,
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
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.black,
                                    //title = what do you change
                                    title: Text(
                                      "Change Email/Phone Number: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    //content = TextFormField to change the username
                                    content: TextFormField(
                                      controller: emailPhoneController,
                                      validator: (emailPhoneController) {
                                        var nonNullValue =
                                            emailPhoneController ?? '';
                                        if (nonNullValue.isEmpty) {
                                          return ("Email/Phone Number is required");
                                        }
                                        if (!emailPattern
                                                .hasMatch(nonNullValue) &&
                                            !phonePatttern
                                                .hasMatch(nonNullValue)) {
                                          return ("Please enter valid email/phone number");
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                      ),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    //action = button change or cancel
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          //setState(() {
                                          emailPhoneString =
                                              emailPhoneController.text;
                                          Navigator.pop(context);
                                          //});
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          if (emailPhoneController.text
                                              .startsWith('0')) {
                                            if (await updateUser(
                                                2, emailPhoneController.text)) {
                                              Navigator.pop(context);
                                            }
                                          } else {
                                            if (await updateUser(3,
                                                emailPhoneController.text)) {
                                                  Navigator.pop(context);
                                              }
                                          }
                                        },
                                        child: const Text('Change'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: screensize.height * 0.05),

                      //Password
                      Stack(
                        children: <Widget>[
                          TextFormField(
                            obscureText: true,
                            // initialValue: "TurnUP",
                            readOnly: true,
                            controller: passController,
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
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              icon: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.black,
                                    //title = what do you change
                                    title: Text(
                                      "Change Email/Phone Number: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    //content = TextFormField to change the username
                                    content: TextFormField(
                                      controller: emailPhoneController,
                                      validator: (PassCurrentValue) {
                                        var passNonNullValue =
                                            PassCurrentValue ?? "";
                                        if (passNonNullValue.isEmpty) {
                                          return ("Password is required");
                                        } else if (passNonNullValue.length <
                                            6) {
                                          return ("Password Must be more than 5 characters");
                                        } else if (!passPattern
                                            .hasMatch(passNonNullValue)) {
                                          return ("Password should contain upper,lower,digit and Special character ");
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue)),
                                      ),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    //action = button change or cancel
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          //setState(() {
                                          passString = passController.text;
                                          Navigator.pop(context);
                                          //});
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Change'),
                                        child: const Text('Change'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),

                      //Logout
                      SizedBox(height: screensize.height * 0.1),

                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                          ),
                          child: Text(
                            "Logout",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          onPressed: () async {
                            if (await logout()) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()),
                                  (route) => false);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(15),
      //   child: SingleChildScrollView(
      //       child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text(
      //         'Task',
      //         style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 35,
      //             fontWeight: FontWeight.bold),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Text(
      //         'October, 11th 2023',
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 15,
      //         ),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Container(
      //           padding: EdgeInsets.all(5),
      //           child: Center(child: Text('Title')),
      //           width: 100,
      //           decoration: BoxDecoration(
      //               border: Border.all(
      //                 color: Colors.white,
      //                 width: 1,
      //               ),
      //               borderRadius: BorderRadius.all(Radius.circular(20)))),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Container(
      //         padding:
      //             EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
      //         decoration: BoxDecoration(
      //             color: Colors.white,
      //             border: Border.all(color: Colors.blue, width: 5),
      //             borderRadius: BorderRadius.all(Radius.circular(10))),
      //         constraints: BoxConstraints(
      //             minWidth: MediaQuery.of(context).size.width, maxHeight: 100),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Container(
      //           padding: EdgeInsets.all(5),
      //           child: Center(child: Text('Description')),
      //           width: 100,
      //           decoration: BoxDecoration(
      //               border: Border.all(
      //                 color: Colors.white,
      //                 width: 1,
      //               ),
      //               borderRadius: BorderRadius.all(Radius.circular(20)))),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       Container(
      //         padding:
      //             EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
      //         decoration: BoxDecoration(
      //             color: Colors.white,
      //             border: Border.all(color: Colors.blue, width: 5),
      //             borderRadius: BorderRadius.all(Radius.circular(10))),
      //         constraints: BoxConstraints(
      //             minWidth: MediaQuery.of(context).size.width, maxHeight: 150),
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //       TextButton(
      //           style: TextButton.styleFrom(
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.all(Radius.circular(30))),
      //             backgroundColor: Colors.blue,
      //             padding:
      //                 EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
      //             side: BorderSide(color: Colors.white, width: 1),
      //           ),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //           child: Text(
      //             'Done',
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold),
      //           ))
      //     ],
      //   )),
      // ),
    );
  }
}
