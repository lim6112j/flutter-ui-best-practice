import 'package:flutter/material.dart';
import 'package:gecko_app/models/gecko.dart';
import 'package:gecko_app/screens/details/details_screen.dart';
import 'package:gecko_app/screens/home/components/featured_gecko_card.dart';

class FeaturedGeckos extends StatelessWidget {
  final List<Gecko>? geckos;
  const FeaturedGeckos({Key? key, this.geckos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeaturedGeckoCard(
            image: geckos![3].thumbnail as String,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(image: geckos![3].thumbnail as String),
                  ));
            },
          ),
          FeaturedGeckoCard(
            image: geckos![5].thumbnail as String,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(image: geckos![5].thumbnail as String),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
