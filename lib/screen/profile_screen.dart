import 'package:flutter/material.dart';
import 'package:mediminder/auth/authmethod.dart';
import 'package:mediminder/screen/your_booking_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AuthMethod authMethod = AuthMethod();
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              authMethod.auth.currentUser.displayName ?? "Name",
              style: TextStyle(
                  fontSize: size.height * 0.035, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              authMethod.auth.currentUser.email ?? "",
              style: TextStyle(
                  fontSize: size.height * 0.03,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.bookmark,
                    size: 40,
                  ),
                  Icon(
                    Icons.notifications,
                    size: 40,
                  ),
                  Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  Icon(
                    Icons.payment,
                    size: 40,
                  )
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => YourBookingScreen(),
                  ),
                ),
                child: Text("Your Booking",
                    style: TextStyle(fontSize: 20, color: Colors.grey)),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Favourite Resturants",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Online Booking Help",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Send Feedback",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Report",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Divider(),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: GestureDetector(
                  onTap: () {
                    authMethod.auth.signOut();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                )),
            Divider(),
          ],
        ),
      ),
    );
  }
}
