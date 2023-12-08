import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:uncrazy/data/user/user.dart';
import 'package:uncrazy/screen/profile/profile_screen_controller.dart';
import 'package:uncrazy/screen/welcome/welcome_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

/*Problem with profile screen:
  - Change photo profile not yet implemented
  - Cannot change the username by the change button (dont know how to implement this)
*/

class ProfileScreen extends StatefulWidget {
  User user;
  ProfileScreen(this.user);

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final emailPhoneController = TextEditingController();
  final nameController = TextEditingController();

  final passCurrController = TextEditingController();
  final passNewController = TextEditingController();

  String nameString = " ";
  String emailPhoneString = " ";
  String passString = " ";

  final _formKey = GlobalKey<FormState>();

  File? _imageFile;
  final imagePicker = ImagePicker();

  bool isObscureText = true;

  String? getStringImage(File? file) {
    if (file == null) return null;
    return base64Encode(file.readAsBytesSync());
  }

  Future<String> getImage() async {
    final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
      return getStringImage(_imageFile) ?? '';
    }
    return '';
  }

  void _togglePasswordVisibility() {
    if (isObscureText == false) {
      setState(() {
        isObscureText = true;
      });
    } else {
      setState(() {
        isObscureText = false;
      });
    }
  }

  // Future<String> _pickImage() async {
  //   final pickedImage = await imagePicker.getImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _imageFile = File(pickedImage.path) as PickedFile?;
  //     });
  //     return getStringImage(_imageFile as File?) ?? '';
  //   }
  //   return '';
  // }

  @override
  void initState() {
    nameController.text = widget.user.name;
    emailPhoneController.text = widget.user.email ?? widget.user.phone_no ?? '';
    super.initState();
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
                        child: _imageFile != null
                            ? ClipOval(
                                child: Image.file(
                                  File(_imageFile!.path),
                                  width: 250,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : widget.user.image != null
                                ? Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${widget.user.image}'),
                                            fit: BoxFit.cover)))
                                : CircleAvatar(
                                    backgroundImage:
                                        AssetImage("assets/images/logo.png"),
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
                          onPressed: () async {
                            String image = await getImage();
                            if (image != '') {
                              print('image');
                              await updateUser(0, image);
                            }
                          },
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
                                  barrierDismissible: false,
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
                                          nameController.text =
                                              widget.user.name;
                                          Navigator.pop(context);
                                          //});
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          if (nameController.text.isNotEmpty) {
                                            if (await updateUser(
                                                1, nameController.text)) {
                                              Navigator.pop(context, 'Change');
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

                      //Email/Phone Number
                      Stack(
                        children: <Widget>[
                          TextFormField(
                            // initialValue: "email@mail.com",
                            readOnly: true,
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
                                  barrierDismissible: false,
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
                                          emailPhoneController.text =
                                              widget.user.email ??
                                                  widget.user.phone_no ??
                                                  '';
                                          Navigator.pop(context);
                                          //});
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          if (widget.user.phone_no != null) {
                                            if (phonePatttern.hasMatch(
                                                emailPhoneController.text)) {
                                              if (await updateUser(2,
                                                  emailPhoneController.text)) {
                                                Navigator.pop(context);
                                              }
                                            }
                                          } else {
                                            if (emailPattern.hasMatch(
                                                emailPhoneController.text)) {
                                              if (await updateUser(2,
                                                  emailPhoneController.text)) {
                                                Navigator.pop(context);
                                              }
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
                            controller: passCurrController,
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
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: Colors.black,
                                    title: Text(
                                      "Change Password: ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    content: Text(
                                      "Please contact the cp below for changing your password\n(+62)823-7211-6118",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
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
    );
  }
}

                                    // //title = what do you change
                                    // title: Text(
                                    //   "Change Password: ",
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 18,
                                    //   ),
                                    // ),
                                    // //content = TextFormField to change the username
                                    // content: Column(
                                    //     mainAxisSize: MainAxisSize.min,
                                    //     children: <Widget>[
                                    //       TextFormField(
                                    //         obscureText: isObscureText,
                                    //         controller: passCurrController,
                                    //         validator: (PassCurrentValue) {
                                    //           var passNonNullValue =
                                    //               PassCurrentValue ?? "";
                                    //           if (passNonNullValue.isEmpty) {
                                    //             return ("Password is required");
                                    //           } else if (passNonNullValue
                                    //                   .length <
                                    //               8) {
                                    //             return ("Password must be at least 8 characters");
                                    //           }
                                    //           return null;
                                    //         },
                                    //         decoration: InputDecoration(
                                    //           focusedBorder:
                                    //               UnderlineInputBorder(
                                    //                   borderSide: BorderSide(
                                    //                       color: Colors.blue)),
                                    //           enabledBorder:
                                    //               UnderlineInputBorder(
                                    //                   borderSide: BorderSide(
                                    //                       color: Colors.blue)),
                                    //           labelText: "Old Password",
                                    //           labelStyle: TextStyle(
                                    //             color: Colors.white,
                                    //             fontSize: 18,
                                    //           ),
                                    //           suffixIcon: IconButton(
                                    //             icon: Icon(
                                    //               isObscureText
                                    //                   ? Icons.visibility_off
                                    //                   : Icons.visibility,
                                    //               color: Colors.white,
                                    //             ),
                                    //             onPressed: () {
                                    //               _togglePasswordVisibility();
                                    //             },
                                    //           ),
                                    //         ),
                                    //         style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontSize: 18),
                                    //       ),
                                    //       TextFormField(
                                    //         obscureText: isObscureText,
                                    //         controller: passNewController,
                                    //         validator: (PassCurrentValue) {
                                    //           var passNonNullValue =
                                    //               PassCurrentValue ?? "";
                                    //           if (passNonNullValue.isEmpty) {
                                    //             return ("Password is required");
                                    //           } else if (passNonNullValue
                                    //                   .length <
                                    //               8) {
                                    //             return ("Password must be at least 8 characters");
                                    //           }
                                    //           return null;
                                    //         },
                                    //         decoration: InputDecoration(
                                    //           focusedBorder:
                                    //               UnderlineInputBorder(
                                    //                   borderSide: BorderSide(
                                    //                       color: Colors.blue)),
                                    //           enabledBorder:
                                    //               UnderlineInputBorder(
                                    //                   borderSide: BorderSide(
                                    //                       color: Colors.blue)),
                                    //           labelText: "New Password",
                                    //           labelStyle: TextStyle(
                                    //             color: Colors.white,
                                    //             fontSize: 18,
                                    //           ),
                                    //           suffixIcon: IconButton(
                                    //             icon: Icon(
                                    //               isObscureText
                                    //                   ? Icons.visibility_off
                                    //                   : Icons.visibility,
                                    //               color: Colors.white,
                                    //             ),
                                    //             onPressed: () {
                                    //               _togglePasswordVisibility();
                                    //             },
                                    //           ),
                                    //         ),
                                    //         style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontSize: 18),
                                    //       ),
                                    //     ]),
                                    // //action = button change or cancel
                                    // actions: <Widget>[
                                    //   TextButton(
                                    //     onPressed: () {
                                    //       //setState(() {
                                    //       passString = passCurrController.text;
                                    //       Navigator.pop(context);
                                    //       //});
                                    //     },
                                    //     child: const Text('Cancel'),
                                    //   ),
                                    //   TextButton(
                                    //     onPressed: () {
                                    //       if (passCurrController.text ==
                                    //           passNewController) {
                                    //         //DO something zee :D
                                    //       } else if (_formKey.currentState!
                                    //           .validate()) {
                                    //         // DO something zee :D
                                    //       }
                                    //       Navigator.pop(context, 'Change');
                                    //     },
                                    //     child: const Text('Change'),
                                    //   ),
                                    // ],
