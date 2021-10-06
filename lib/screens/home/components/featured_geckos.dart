import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/featured_gecko_card.dart';
class FeaturedGeckos extends StatelessWidget {
  const FeaturedGeckos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeaturedGeckoCard(
            image: 'assets/images/blue_finger_resized.png',
            press : () {},
          ),
          FeaturedGeckoCard(
            image: 'assets/images/lemon_frost_resized.png',
            press : () {},
          ),
        ],
      ),
    );
  }
}
