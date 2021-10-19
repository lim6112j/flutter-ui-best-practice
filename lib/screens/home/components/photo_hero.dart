import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget{
  const PhotoHero({ Key? key, this.onTap, this.img}) : super(key: key);
  final String? img;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
                child: Hero(
                    tag: img!,
                    child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                            onTap: onTap,
                            child:
                                Image.asset(img!)))),
              );
  }
}
