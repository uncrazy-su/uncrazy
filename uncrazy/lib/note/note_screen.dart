import 'package:flutter/material.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: (Icon(
              Icons.arrow_back,
              size: 30,
            )),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Notes',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'October, 11th 2023',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Center(child: Text('Title')),
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    maxHeight: 200),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(5),
                  child: Center(child: Text('Image')),
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
              SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width,
                    maxHeight: 200),
              ),
              SizedBox(
                height: 20,
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
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Done',
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
