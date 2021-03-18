import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mediminder/model/itemmodel.dart';
import 'package:mediminder/model/restuarant.dart';
import 'package:mediminder/screen/pay_book_screen.dart';

class PreOrderBookingScreen extends StatefulWidget {
  final Restuarant restuarant;
  final String title;
  PreOrderBookingScreen({this.restuarant, this.title});

  @override
  _PreOrderBookingScreenState createState() => _PreOrderBookingScreenState();
}

class _PreOrderBookingScreenState extends State<PreOrderBookingScreen> {
  final List<Item> additemList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.title,
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
        ),
      ),
      body: widget.restuarant.items.length == 0 ||
              widget.restuarant.items.isEmpty
          ? Column(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "No items",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: size.width * 0.5,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PayAndBookScreen(
                                items: additemList,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Order",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ...List.generate(widget.restuarant.items.length, (index) {
                    return Container(
                      height: size.height * 0.12,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 5)
                      ], color: Colors.white),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: size.height * 0.1,
                            width: size.height * 0.1,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                widget.restuarant.items[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                widget.restuarant.items[index].name,
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                "\u{20B9}${widget.restuarant.items[index].price}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Flexible(child: Container()),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                additemList.add(widget.restuarant.items[index]);

                                Fluttertoast.showToast(
                                    msg:
                                        "${widget.restuarant.items[index].name} add successfully...",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.black);
                                widget.restuarant.items
                                    .remove(widget.restuarant.items[index]);
                              });
                            },
                            child: Text("Add"),
                          )
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PayAndBookScreen(
                                  items: additemList,
                                  restuarant: widget.restuarant,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Order",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
    );
  }
}
