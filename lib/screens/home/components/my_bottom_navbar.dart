import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gecko_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:gecko_app/state/ScrollModel.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar();
  @override
  State<StatefulWidget> createState() {
    return MyBottomNavBarState();
  }
}

class MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    print("my bottom nav bar rendering ...");
    return Consumer<ScrollModel>(
        builder: (context, model, child) =>
            buildContainer(context, model.hidden));
  }
}

AnimatedContainer buildContainer(BuildContext context, bool hidden) {
  return AnimatedContainer(
    height: hidden ? 0.0 : 60.0,
    duration: const Duration(milliseconds: 200),
    curve: Curves.fastOutSlowIn,
    child: Container(
        padding: EdgeInsets.only(
            left: kDefaultPadding * 2,
            right: kDefaultPadding * 2,
            bottom: kDefaultPadding / 2),
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 6,
              color: Colors.black.withOpacity(0.7),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/icons/flower.svg"),
              onPressed: () {},
            ),
            IconButton(
                icon: SvgPicture.asset("assets/icons/heart-icon.svg"),
                onPressed: () {}),
            IconButton(
              icon: SvgPicture.asset("assets/icons/user-icon.svg"),
              onPressed: () {},
            ),
          ],
        )),
  );
}
