import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/body.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print("home_screen rendering ....");
    return Scaffold(
      body: Body(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
