import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mediminder/screen/SearchScreen.dart';
import 'package:mediminder/screen/cart_screen.dart';
import 'package:mediminder/screen/profile_screen.dart';
import 'package:mediminder/screen/restaurant_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: _selected == 0
            ? homescreen(size)
            : _selected == 1
                ? SearchScreen()
                : _selected == 3
                    ? ProfileScreen()
                    : CartScreen(
                        selected: () => setState(() {
                          _selected = 1;
                        }),
                      ),
        bottomNavigationBar: bottomAppBar());
  }

  homescreen(size) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5)
            ], color: Colors.white),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.home,
                    size: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: size.height * 0.035,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Vishwas City, Chanakyapuri",
                      style: TextStyle(
                          fontSize: size.height * 0.02, color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: size.height * 0.786,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return buildListTile(size, index);
                },
                itemCount: 5,
              ),
            ),
          )
        ],
      ),
    );
  }

  bottomAppBar() {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 5)
      ], color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            padding: EdgeInsets.only(bottom: 10),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.home,
              color: _selected == 0 ? Colors.red : Colors.black,
              size: 45,
            ),
            onPressed: () => setState(() {
              _selected = 0;
            }),
          ),
          IconButton(
            padding: EdgeInsets.only(bottom: 10),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.search,
              color: _selected == 1 ? Colors.red : Colors.black,
              size: 45,
            ),
            onPressed: () => setState(() {
              _selected = 1;
            }),
          ),
          IconButton(
            padding: EdgeInsets.only(bottom: 10),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.shopping_cart,
              color: _selected == 2 ? Colors.red : Colors.black,
              size: 45,
            ),
            onPressed: () => setState(() {
              _selected = 2;
            }),
          ),
          IconButton(
            padding: EdgeInsets.only(bottom: 10),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(
              Icons.person,
              color: _selected == 3 ? Colors.red : Colors.black,
              size: 45,
            ),
            onPressed: () => setState(() {
              _selected = 3;
            }),
          )
        ],
      ),
    );
  }

  Widget buildListTile(Size size, int index) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RestaurantMenu()),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38, blurRadius: 10, offset: Offset(0, 2))
            ]),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 400,
              color: Colors.white,
              child: Image.asset(
                "assets/photo${index + 1}.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Sugarless Life",
                          style: TextStyle(
                              fontSize: size.height * 0.02,
                              color: Colors.black),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                          ),
                          Text(
                            "4.0/5",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Desserts, Italian, Sandwich",
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Colors.black45),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              "Navragpura, Ahmedabad",
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Colors.black45),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              "Opena at 9 am",
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "\$450 for two",
                        style: TextStyle(
                            fontSize: size.height * 0.02, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
