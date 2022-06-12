import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';

class CardWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CardWidgetState();
  }
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double fontSize(double size) {
      return size * width / 414;
    }

    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(horizontal: width / 20),
            alignment: Alignment.centerLeft,
            child: Text("Card Selected",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: fontSize(20)))),
      ],
    );
  }
}
