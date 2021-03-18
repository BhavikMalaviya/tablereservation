import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mediminder/model/restuarant.dart';

import 'booking_screen.dart';

class BookATableScreen extends StatelessWidget {
  final Restuarant restuarant;
  BookATableScreen({this.restuarant});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text("Tables",
                style: TextStyle(
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
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
                                TextButton(
                                    child: new Text("Yes"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Restuarant restuarantinfo = Restuarant(
                                          address: restuarant.address,
                                          dis: restuarant.dis,
                                          email: restuarant.email,
                                          menuPic: restuarant.menuPic,
                                          name: restuarant.name,
                                          phone: restuarant.phone,
                                          pic: restuarant.pic,
                                          time: restuarant.time,
                                          items: restuarant.items,
                                          tableSize: '2');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookingScreen(
                                            restuarant: restuarantinfo,
                                          ),
                                        ),
                                      );
                                    }),
                                TextButton(
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
                                TextButton(
                                    child: new Text("Yes"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Restuarant restuarantinfo = Restuarant(
                                          address: restuarant.address,
                                          dis: restuarant.dis,
                                          email: restuarant.email,
                                          menuPic: restuarant.menuPic,
                                          name: restuarant.name,
                                          phone: restuarant.phone,
                                          pic: restuarant.pic,
                                          time: restuarant.time,
                                          items: restuarant.items,
                                          tableSize: '3');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookingScreen(
                                            restuarant: restuarantinfo,
                                          ),
                                        ),
                                      );
                                    }),
                                TextButton(
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
                                TextButton(
                                    child: new Text("Yes"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Restuarant restuarantinfo = Restuarant(
                                          address: restuarant.address,
                                          dis: restuarant.dis,
                                          email: restuarant.email,
                                          menuPic: restuarant.menuPic,
                                          name: restuarant.name,
                                          phone: restuarant.phone,
                                          pic: restuarant.pic,
                                          time: restuarant.time,
                                          items: restuarant.items,
                                          tableSize: '4');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookingScreen(
                                            restuarant: restuarantinfo,
                                          ),
                                        ),
                                      );
                                    }),
                                TextButton(
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
