import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gecko_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:gecko_app/state/ScrollModel.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar(this.controller, this.index);
  final PageController controller;
  final int index;
  @override
  State<StatefulWidget> createState() {
    return MyBottomNavBarState();
  }
}

class MyBottomNavBarState extends State<MyBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScrollModel>(
        builder: (context, model, child) => buildContainer(
            context, model.hidden, widget.controller, widget.index));
  }
}

AnimatedContainer buildContainer(
    BuildContext context, bool hidden, PageController controller, int index) {
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
              icon: index == 0
                  ? SvgPicture.asset("assets/icons/flower_white.svg")
                  : SvgPicture.asset("assets/icons/flower.svg"),
              onPressed: () {
                controller.animateToPage(0,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: index == 1
                  ? SvgPicture.asset("assets/icons/heart-icon-white.svg")
                  : SvgPicture.asset("assets/icons/heart-icon.svg"),
              onPressed: () {
                controller.animateToPage(1,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              },
            ),
            IconButton(
              icon: index == 2
                  ? SvgPicture.asset("assets/icons/user-icon-white.svg")
                  : SvgPicture.asset("assets/icons/user-icon.svg"),
              onPressed: () {
                controller.animateToPage(2,
                    duration: Duration(milliseconds: 400), curve: Curves.ease);
              },
            ),
          ],
        )),
  );
}
