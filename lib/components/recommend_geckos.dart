import 'package:flutter/material.dart';
import 'package:gecko_app/components/recommend_gecko_card.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/screens/details/details_screen.dart';
class RecommendGeckos extends StatelessWidget {
  const RecommendGeckos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendGeckoCard(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(image:  'assets/images/blue.png'),
                )
              );
            },
            country: 'rusia',
            image: 'assets/images/blue.png',
            price: 200,
            title: "ben lim"
          ),
          RecommendGeckoCard(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(image:  'assets/images/orange.jpeg'),
                )
              );
            },
            country: 'korea',
            image: 'assets/images/orange.jpeg',
            price: 400,
            title: "samantha"
          ),
          RecommendGeckoCard(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(image:  'assets/images/yelllow.jpeg'),
                )
              );
            },
            country: 'Japan',
            image: 'assets/images/yelllow.jpeg',
            price: 800,
            title: "nakamura"
          ),
        ],
      ),
    );
  }
}