import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';

class FineRichText extends StatelessWidget {
  const FineRichText({Key? key, this.message}) : super(key: key);
  final String? message;
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text:
                "Geckos are small, mostly carnivorous lizards that have a wide distribution, found on every continent except Antarctica. Belonging to the infraorder Gekkota, geckos are found in warm climates throughout the world. They range from 1.6 to 60 centimetres (0.6 to 23.6 inches). ",
            style: TextStyle(color: kTextColor, fontSize: 8)));
  }
}
