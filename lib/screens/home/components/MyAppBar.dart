import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/screens/home/components/header_with_scrollmenu.dart';

class MyAppBar extends StatefulWidget {
  MyAppBar(this.size);
  final Size size;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppBarState();
  }
}

class MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: kPrimaryColor,
        //leading: IconButton(
        //icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
        title: Container(
            width: double.infinity,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            //child: buildSearch()
            child: HeaderWithScrollMenu(size: widget.size)));
  }
}
