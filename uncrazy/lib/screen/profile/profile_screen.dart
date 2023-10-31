import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF2B2B2B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: screensize.width,
          child: Padding(
            padding: EdgeInsets.only(
                left: screensize.width * 0.1,
                right: screensize.width * 0.1,
                top: screensize.height * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
              ],
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
