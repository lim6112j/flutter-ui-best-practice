import 'package:flutter/material.dart';
import 'package:gecko_app/screens/details/components/body.dart';
class DetailsScreen extends StatelessWidget {
  final String image;

  const DetailsScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Body(image: image,),
    );
  }
}
