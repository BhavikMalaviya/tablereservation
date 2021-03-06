import 'dart:ui';

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final Function selected;
  CartScreen({this.selected});
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("GOOD FOOD IS ALWAYS COOKING",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text("Your cart is empty",
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                  )),
              Text("add somthing from the menu",
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                  )),
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                width: size.width * 0.7,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 10,
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: widget.selected,
                  child: Text(
                    "Brower Restaurants",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
