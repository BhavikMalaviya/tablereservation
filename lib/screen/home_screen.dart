import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mediminder/model/itemmodel.dart';
import 'package:mediminder/model/restuarant.dart';
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

  List<Restuarant> resturant = [
    Restuarant(
      name: "The Grand Thakar",
      address:
          "2nd Floor, Madhav Orchid, Odhav Vastral Road, Sp Ring Road, Odhav GIDC, Ahmedabad - 382415, Opposite,Grand Vishala Estate",
      phone: "+917949071763",
      time: "10:00 am - 11:30 pm",
      pic: 'assets/main/The Grand Thakar.jpg',
      dis: 'Bread Pakoda, GulabJamun, Khandvi, Samosa',
      menuPic: 'assets/menu/The Grand Thakar.jpg',
      email: 'thegrandthakar@gmail.com',
      items: [
        Item(
            image: 'assets/items/The Grand Thakar/breadPakoda.jpg',
            name: "breadPakoda",
            price: '45',
            noItem: 1),
        Item(
            image: 'assets/items/The Grand Thakar/GulabJamun.jpg',
            name: "GulabJamun",
            price: '50',
            noItem: 1),
        Item(
            image: 'assets/items/The Grand Thakar/Khandvi.jpg',
            name: "Khandvi",
            price: '40',
            noItem: 1),
        Item(
            image: 'assets/items/The Grand Thakar/Samosa.jpg',
            name: "Samosa",
            price: '40',
            noItem: 1)
      ],
    ),
    Restuarant(
      name: "Wagh Bakri Tea Lounge",
      address:
          "Ground Floor, Aryan Work Spaces, Near Saint Xavier College, Navrangpura, Ahmedabad",
      phone: "+918347771700",
      time: "10:00 am – 10:00 pm",
      pic: 'assets/main/Wagh Bakri Tea Lounge.jpg',
      dis: 'ChocolateBrownie, ColdDrinks, Sandwitch, Tea',
      menuPic: 'assets/menu/Wagh Bakri Tea Lounge.jpg',
      email: "waghbakritealounge@gmail.com",
      items: [
        Item(
            image: 'assets/items/Wagh Bakri Tea Lounge/ChocolateBrownie.jpg',
            name: "ChocolateBrownie",
            price: '45',
            noItem: 1),
        Item(
            image: 'assets/items/Wagh Bakri Tea Lounge/ColdDrinks.jpg',
            name: "ColdDrinks",
            price: '50',
            noItem: 1),
        Item(
            image: 'assets/items/Wagh Bakri Tea Lounge/Sandwitch.jpg',
            name: "Sandwitch",
            price: '40',
            noItem: 1),
        Item(
            image: 'assets/items/Wagh Bakri Tea Lounge/Tea.jpg',
            name: "Tea",
            price: '40',
            noItem: 1)
      ],
    ),
    Restuarant(
      name: "The Jungle Bhookh",
      address: "103/B, Wall Street 1, Ellis Bridge, Ahmedabad - 380006",
      phone: "+917947072509",
      time: "10:00 am – 10:00 pm",
      pic: 'assets/main/the Jungle Bhookh.jpeg',
      dis: 'KhoyaKaju, MalaiKofta, Pizza, VegBiryani',
      menuPic: 'assets/menu/the Jungle Bhookh.jpg',
      email: 'thejunglebhook@gmail.com',
      items: [
        Item(
            image: 'assets/items/the Jungle Bhookh/KhoyaKaju.jpg',
            name: "KhoyaKaju",
            price: '45',
            noItem: 1),
        Item(
            image: 'assets/items/the Jungle Bhookh/MalaiKofta.jpg',
            name: "MalaiKofta",
            price: '50',
            noItem: 1),
        Item(
            image: 'assets/items/the Jungle Bhookh/Pizza.jpg',
            name: "Pizza",
            price: '40',
            noItem: 1),
        Item(
            image: 'assets/items/the Jungle Bhookh/VegBiryani.jpg',
            name: "VegBiryani",
            price: '40',
            noItem: 1)
      ],
    ),
    Restuarant(
      name: "Barbeque World",
      address:
          "104, 1st Floor, Sigma Ceejay, IIM Road, Panjrapole Cross Road, Panjrapole, Ahmedabad - 380015",
      phone: "+917947073168",
      time: "10:30 am - 10:30 pm",
      pic: 'assets/main/Barbeques.jpg',
      dis: 'Barbeques, Drinks, Pasta',
      menuPic: 'assets/menu/Barbeque World.jpg',
      email: 'barbequeworld@gmail.com',
      items: [
        Item(
            image: 'assets/items/Barbeque World/Barbeques.jpg',
            name: "Barbeques",
            price: '45',
            noItem: 1),
        Item(
            image: 'assets/items/Barbeque World/Drinks.jpg',
            name: "Drinks",
            price: '50',
            noItem: 1),
        Item(
            image: 'assets/items/Barbeque World/Pasta.jpg',
            name: "Pasta",
            price: '40',
            noItem: 1)
      ],
    ),
    Restuarant(
      name: "Grand Rio Restaurant",
      address:
          "1st & 2nd Floor, Shlok Infinity, Chandlodiya Road, Gota Road, Ahmedabad - 382481",
      phone: "+917698971429",
      time: "11:00 am - 10:30 pm",
      pic: 'assets/main/Grand rio.jpg',
      dis: 'Full Gujarati Dish, Manchurian, RotiSabji, Salad',
      menuPic: 'assets/menu/Grand rio restaurant.jpg',
      email: 'grandriorestaurant@gmail.com',
      items: [
        Item(
            image: 'assets/items/Grand rio restaurant/FullGujaratiDish.jpg',
            name: "Full Gujarati Dish",
            price: '45',
            noItem: 1),
        Item(
            image: 'assets/items/Grand rio restaurant/Manchurian.jpg',
            name: "Manchurian",
            price: '50',
            noItem: 1),
        Item(
            image: 'assets/items/Grand rio restaurant/RotiSabji.jpg',
            name: "RotiSabji",
            price: '40',
            noItem: 1),
        Item(
            image: 'assets/items/Grand rio restaurant/Salad.jpg',
            name: "Salad",
            price: '40',
            noItem: 1)
      ],
    ),
  ];

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
                itemCount: resturant.length,
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
        MaterialPageRoute(
            builder: (context) => RestaurantMenu(
                  restuarant: resturant[index],
                )),
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
                resturant[index].pic,
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
                          resturant[index].name,
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
                              resturant[index].dis,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Colors.black45),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              resturant[index].address,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Colors.black45),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              "Open at ${resturant[index].time}",
                              style: TextStyle(
                                  fontSize: size.height * 0.02,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "\u{20B9}450 for two",
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
