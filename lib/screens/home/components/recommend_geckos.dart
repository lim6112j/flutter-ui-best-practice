import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/recommend_gecko_card.dart';
import 'package:gecko_app/models/gecko.dart';
import 'package:gecko_app/screens/details/details_screen.dart';

class RecommendGeckos extends StatelessWidget {
  final List<Gecko>? geckos;
  const RecommendGeckos({
    Key? key,
    this.geckos,
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
                      builder: (context) =>
                          DetailsScreen(image: geckos![0].thumbnail as String),
                    ));
              },
              country: geckos![0].origin as String,
              image: geckos![0].thumbnail as String,
              price: 200,
              title: geckos![0].name as String),
          RecommendGeckoCard(
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(image: geckos![1].thumbnail as String),
                    ));
              },
              country: geckos![1].origin as String,
              image: geckos![1].thumbnail as String,
              price: 400,
              title: geckos![1].name as String),
          RecommendGeckoCard(
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailsScreen(image: geckos![2].thumbnail as String),
                    ));
              },
              country: geckos![2].origin as String,
              image: geckos![2].thumbnail as String,
              price: 800,
              title: geckos![2].name as String),
        ],
      ),
    );
  }
}
