import 'package:mediminder/model/itemmodel.dart';

class Restuarant {
  String name;
  String time;
  String phone;
  String pic;
  String address;
  String dis;
  String menuPic;
  List<Item> items;
  String email;
  String bookingDate;
  String bookingTime;
  String tableSize;
  String bookingType;

  Restuarant(
      {this.address,
      this.name,
      this.phone,
      this.pic,
      this.time,
      this.items,
      this.dis,
      this.menuPic,
      this.bookingDate,
      this.bookingTime,
      this.tableSize,
      this.bookingType,
      this.email});
}
