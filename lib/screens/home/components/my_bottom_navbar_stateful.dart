import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/screens/family/Bloodline.dart';

class MyBottomNavBarStateful extends StatefulWidget {
  MyBottomNavBarStateful({Key? key, required this.hidden}) : super(key: key);
  var hidden;
  @override
  State<StatefulWidget> createState() {
    return MyBottomNavBarStatefulState();
  }

  @override
  Widget build(BuildContext context) {
    return buildContainer(context, hidden);
  }
}

class MyBottomNavBarStatefulState extends State<MyBottomNavBarStateful> {
  String? message;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("######## ${widget.hidden}");
    return buildContainer(context, widget.hidden);
  }
}

AnimatedContainer buildContainer(BuildContext context, bool hidden) {
  return AnimatedContainer(
    height: hidden ? 0.0 : 60.0,
    duration: const Duration(milliseconds: 400),
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Bloodline(title: "Family Bloodline"),
                    ));
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/user-icon.svg"),
              onPressed: () {},
            ),
          ],
        )),
  );
}
