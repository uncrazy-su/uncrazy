import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;

    return SingleChildScrollView(
        child: SafeArea(
      //The start
      child: Container(
        width: screensize.width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: screensize.width,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "  Today  ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    ));
  }
}

// return Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           leading: IconButton(
//             icon: (Icon(
//               Icons.arrow_back,
//               size: 30,
//             )),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           backgroundColor: Colors.black,
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(15),
//           child: SingleChildScrollView(
//               child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 'Task',
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 35,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 'October, 11th 2023',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 15,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   padding: EdgeInsets.all(5),
//                   child: Center(child: Text('Title')),
//                   width: 100,
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20)))),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding:
//                     EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.blue, width: 5),
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 constraints: BoxConstraints(
//                     minWidth: MediaQuery.of(context).size.width,
//                     maxHeight: 100),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                   padding: EdgeInsets.all(5),
//                   child: Center(child: Text('Description')),
//                   width: 100,
//                   decoration: BoxDecoration(
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(20)))),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding:
//                     EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.blue, width: 5),
//                     borderRadius: BorderRadius.all(Radius.circular(10))),
//                 constraints: BoxConstraints(
//                     minWidth: MediaQuery.of(context).size.width,
//                     maxHeight: 150),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton(
//                   style: TextButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(30))),
//                     backgroundColor: Colors.blue,
//                     padding:
//                         EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
//                     side: BorderSide(color: Colors.white, width: 1),
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     'Done',
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold),
//                   ))
//             ],
//           )),
//         ));
