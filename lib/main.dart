import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mediminder/auth/authmethod.dart';
import 'package:mediminder/screen/first_screen.dart';
import 'package:mediminder/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthMethod authMethod = AuthMethod();
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: authMethod.auth.currentUser == null ? FirstScreen() : HomeScreen(),
    );
  }
}
