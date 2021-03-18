import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mediminder/model/itemmodel.dart';
import 'package:mediminder/model/restuarant.dart';

class PayAndBookScreen extends StatefulWidget {
  final List<Item> items;
  final Restuarant restuarant;
  PayAndBookScreen({this.items, this.restuarant});
  @override
  _PayAndBookScreenState createState() => _PayAndBookScreenState();
}

class _PayAndBookScreenState extends State<PayAndBookScreen> {
  int _total = 0;
  bool isloading = false;
  List<String> name = [];
  List<String> price = [];
  List<int> noitem = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.items.length; i++) {
      _total =
          _total + (int.parse(widget.items[i].price) * widget.items[i].noItem);

      name.add(widget.items[i].name);
      price.add(widget.items[i].price);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text("My Cart",
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
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "${widget.items.length.toString().padLeft(2, "0")} Items",
                            style: TextStyle(
                                fontSize: size.height * 0.025,
                                color: Colors.grey,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  ...List.generate(widget.items.length, (index) {
                    return Container(
                      height: size.height * 0.12,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 5)
                      ], color: Colors.white),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.only(right: 10),
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
                                widget.items[index].image,
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
                              Container(
                                width: size.width * 0.35,
                                child: Text(
                                  widget.items[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.02,
                              ),
                              Text(
                                "\u{20B9}${widget.items[index].price}",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          Flexible(child: Container()),
                          CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: size.height * 0.02,
                            child: IconButton(
                              color: Colors.black,
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              icon: Icon(
                                Icons.add,
                              ),
                              onPressed: () => setState(
                                () {
                                  widget.items[index].noItem =
                                      widget.items[index].noItem + 1;
                                  _total = _total +
                                      int.parse(widget.items[index].price);
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${(widget.items[index].noItem.toString().padLeft(2, "0"))}",
                              style: TextStyle(
                                fontSize: size.height * 0.02,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: size.height * 0.02,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(),
                              color: Colors.black,
                              icon: Icon(Icons.remove),
                              onPressed: () => setState(
                                () {
                                  if (widget.items[index].noItem > 1) {
                                    widget.items[index].noItem -= 1;
                                    _total = _total -
                                        int.parse(widget.items[index].price);
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black12, spreadRadius: 5, blurRadius: 5)
                    ], color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Total",
                            style: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "${_total.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * 0.5,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: Colors.green,
                      ),
                      onPressed: widget.items.length == 0
                          ? null
                          : () async {
                              try {
                                setState(() {
                                  isloading = true;
                                });

                                print({
                                  "address": widget.restuarant.address,
                                  "email": widget.restuarant.email,
                                  "name": widget.restuarant.name,
                                  "phone": widget.restuarant.phone,
                                  "tableSize": widget.restuarant.tableSize,
                                  "bookingDate": widget.restuarant.bookingDate,
                                  "bookingTime": widget.restuarant.bookingTime,
                                  "bookingType": widget.restuarant.bookingType,
                                  "itemName": name,
                                  "itemPrice": price,
                                  "Total": _total,
                                });
                                await FirebaseFirestore.instance
                                    .collection("restaurant")
                                    .add({
                                  "address": widget.restuarant.address,
                                  "email": widget.restuarant.email,
                                  "name": widget.restuarant.name,
                                  "phone": widget.restuarant.phone,
                                  "tableSize": widget.restuarant.tableSize,
                                  "bookingDate": widget.restuarant.bookingDate,
                                  "bookingTime": widget.restuarant.bookingTime,
                                  "bookingType": widget.restuarant.bookingType,
                                  "Total": _total,
                                  "itemsName": name,
                                  "itemPrice": price,
                                });
                              } catch (e) {
                                print(e);
                              }
                              setState(() {
                                isloading = false;
                              });
                              Navigator.of(context)
                                ..pop()
                                ..pop()
                                ..pop()
                                ..pop()
                                ..pop();
                            },
                      child: Text(
                        "Pay & Book",
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
