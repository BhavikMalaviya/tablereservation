import 'dart:ui';

import 'package:flutter/material.dart';

class BookATableScreen extends StatefulWidget {
  @override
  _BookATableScreenState createState() => _BookATableScreenState();
}

class _BookATableScreenState extends State<BookATableScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            )),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Are you sure?"),
                              actions: [
                                FlatButton(
                                  child: new Text("Yes"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                                FlatButton(
                                  child: new Text("No"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                              ],
                            );
                          }),
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.5,
                        child: Image.asset(
                          'assets/table1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Are you sure?"),
                              actions: [
                                FlatButton(
                                  child: new Text("Yes"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                                FlatButton(
                                  child: new Text("No"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                              ],
                            );
                          }),
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.5,
                        child: Image.asset(
                          'assets/table2.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text("Are you sure?"),
                              actions: [
                                FlatButton(
                                  child: new Text("Yes"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                                FlatButton(
                                  child: new Text("No"),
                                  onPressed: () => Navigator.pop(context, true),
                                ),
                              ],
                            );
                          }),
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.5,
                        child: Image.asset(
                          'assets/table4.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
