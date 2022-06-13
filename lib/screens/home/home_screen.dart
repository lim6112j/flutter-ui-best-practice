import 'package:flutter/material.dart';
import 'package:gecko_app/pages/blue_page.dart';
import 'package:gecko_app/screens/family/Bloodline.dart';
import 'package:gecko_app/screens/home/components/body.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar.dart';
import 'package:gecko_app/screens/settings/settings.dart';
import 'package:gecko_app/state/ScrollModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    ScrollModel scrollModel = context.read<ScrollModel>();
    print("home_screen rendering ....");
    return Scaffold(
      body: PageView(
        children: [
          Body(),
          BluePage(),
          Settings(),
        ],
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            scrollModel.changeHidden(false);
            _currentIndex = newIndex;
          });
        },
      ),
      bottomNavigationBar: MyBottomNavBar(_pageController, _currentIndex),
      //bottomNavigationBar: SizedBox(
      //height: _bottomNavHeight,
      //child: BottomNavigationBar(
      //enableFeedback: true,
      //currentIndex: _currentIndex,
      //onTap: (newIndex) {
      //_pageController.animateToPage(newIndex,
      //duration: Duration(milliseconds: 400), curve: Curves.ease);
      //},
      //items: _bottomNavigationBarItems,
      ////     type: BottomNavigationBarType.fixed
      //),
      //)
    );
  }
}
