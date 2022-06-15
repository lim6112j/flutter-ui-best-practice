import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';

class BluePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
