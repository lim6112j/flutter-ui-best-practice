import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key? key, this.onTap, this.img, this.tagName})
      : super(key: key);
  final String? img;
  final VoidCallback? onTap;
  final String? tagName;
  @override
  Widget build(BuildContext context) {
    //print("$img$tagName");
    return SizedBox(
      child: Hero(
          tag: '$img$tagName',
          child: Material(
              color: Colors.transparent,
              child: InkWell(onTap: onTap, child: Image.asset(img!)))),
    );
  }
}
