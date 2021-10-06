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
      bottomNavigationBar: MyBottomNavBar()
    );
  }
  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        leading: IconButton(icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: (){}),
        backgroundColor: kPrimaryColor,
    );
  }

}

