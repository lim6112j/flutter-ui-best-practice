import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';

class PlaceholderPage extends StatelessWidget {
  PlaceholderPage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: GestureDetector(
        onHorizontalDragEnd: ((details) {
          if (details.primaryVelocity! > 10) {
            Navigator.of(context).pop();
          }
        }),
        child: Container(
          color: Colors.white,
          child: Center(
              child: Text("Cart Page", style: TextStyle(color: kPrimaryColor))),
        ),
      ),
    );
  }
}
