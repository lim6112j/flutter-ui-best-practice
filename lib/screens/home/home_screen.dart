import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/body.dart';
import 'package:gecko_app/screens/home/components/custom_draw.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  List<String> menuItems = [
    'MyPage',
    'News',
    'Bid',
    'Order',
    'Tracking',
    'Help',
    'More'
  ];
  @override
  Widget build(BuildContext context) {
    print("home_screen rendering ....");
    return Scaffold(
      drawer: CustomDraw(items: menuItems),
      body: Body(items: menuItems),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
