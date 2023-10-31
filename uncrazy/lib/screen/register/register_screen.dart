import 'package:flutter/material.dart';
import 'package:uncrazy/screen/home/homescreen.dart';
import 'package:uncrazy/screen/register/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  final emailPhoneController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    Orientation screenOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFF2B2B2B),

      //Upper Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),

      //Body
      body: SingleChildScrollView(child: Container()),
    );
  }
}

// Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Color(0xff1e1e1e),
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
//                 'Welcome!',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               Text(
//                 'Username',
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
//                 controller: nameController,
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
//                     if (await register(nameController.text,
//                         emailPhoneController.text, passController.text)) {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => HomeScreen()));
//                     }
//                   },
//                   child: Text(
//                     'Register',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ))
//             ],
//           )),
//         ));
