import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:mediminder/model/restuarant.dart';
import 'package:intl/intl.dart';
import 'package:mediminder/screen/pre_order_booking_screen.dart';

class BookingScreen extends StatefulWidget {
  final Restuarant restuarant;
  BookingScreen({this.restuarant});
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _time = TextEditingController();

  String date = '';

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
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Table Booking Date:",
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: size.height * 0.01,
                ),
                DateTimePicker(
                  type: DateTimePickerType.date,
                  dateMask: 'd MMM, yyyy',
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }

                    return true;
                  },
                  onChanged: (val) {
                    setState(() {
                      date = val;
                    });
                  },
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) {
                    setState(() {
                      date = val;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  "Table Booking Time:",
                  style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                TextField(
                  controller: _time,
                  onTap: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    DatePicker.showTime12hPicker(context,
                        showTitleActions: true, onConfirm: (date) {
                      _time.text = DateFormat.jm().format(date);
                    }, locale: LocaleType.en);
                  },
                  decoration: InputDecoration(
                      hintText: "Time", prefixIcon: Icon(Icons.timer)),
                ),
                SizedBox(
                  height: size.height * 0.03,
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
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          if (date.isEmpty || _time.text.isEmpty) {
                            print(date);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please Select above details..."),
                              ),
                            );
                            return;
                          }
                          Restuarant restuarantinfo = Restuarant(
                              address: widget.restuarant.address,
                              dis: widget.restuarant.dis,
                              email: widget.restuarant.email,
                              menuPic: widget.restuarant.menuPic,
                              name: widget.restuarant.name,
                              phone: widget.restuarant.phone,
                              pic: widget.restuarant.pic,
                              time: widget.restuarant.time,
                              tableSize: widget.restuarant.tableSize,
                              items: widget.restuarant.items,
                              bookingType: "Pre-Order",
                              bookingDate: date,
                              bookingTime: _time.text);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PreOrderBookingScreen(
                                restuarant: restuarantinfo,
                                title: "Pre-Order",
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Pre-Order",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
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
                          if (date.isEmpty && _time.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please Select above details..."),
                              ),
                            );
                            return;
                          }
                          Restuarant restuarantinfo = Restuarant(
                              address: widget.restuarant.address,
                              dis: widget.restuarant.dis,
                              email: widget.restuarant.email,
                              menuPic: widget.restuarant.menuPic,
                              name: widget.restuarant.name,
                              phone: widget.restuarant.phone,
                              pic: widget.restuarant.pic,
                              time: widget.restuarant.time,
                              tableSize: widget.restuarant.tableSize,
                              items: widget.restuarant.items,
                              bookingType: "Book a Table",
                              bookingDate: date,
                              bookingTime: _time.text);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PreOrderBookingScreen(
                                restuarant: restuarantinfo,
                                title: "Book a Table",
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Book a Table",
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
        ),
      ),
    );
  }
}
