import 'package:flutter/material.dart';
import 'package:mediminder/model/restuarant.dart';
import 'package:mediminder/screen/booktable_screen.dart';

class RestaurantMenu extends StatelessWidget {
  final Restuarant restuarant;
  RestaurantMenu({this.restuarant});
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
      body: Center(
        child: Column(
          children: [
            Text("Fast Food Shop",
                style: TextStyle(
                    fontSize: size.height * 0.05, fontWeight: FontWeight.w700)),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone),
                          Text(
                            " ${restuarant.phone}",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.005,
                      ),
                      Row(
                        children: [
                          Icon(Icons.mail),
                          Text(
                            " ${restuarant.email}",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              height: size.height * 0.55,
              width: size.width * 0.9,
              child: Image.asset(restuarant.menuPic, fit: BoxFit.cover),
            ),
            Spacer(),
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
                      builder: (context) =>
                          BookATableScreen(restuarant: restuarant),
                    ),
                  );
                },
                child: Text(
                  "Book a Table",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
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
