import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gecko_app/screens/home/components/body.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar.dart';
import 'package:gecko_app/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: buildAppBar(),
        body: Body(),
        bottomNavigationBar: MyBottomNavBar());
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
        title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Search for Something",
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.camera_alt)),
              ),
            )));
  }
}
