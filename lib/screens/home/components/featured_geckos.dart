import 'package:flutter/material.dart';
import 'package:gecko_app/models/gecko.dart';
import 'package:gecko_app/screens/details/details_screen.dart';
import 'package:gecko_app/screens/home/components/featured_gecko_card.dart';

class FeaturedGeckos extends StatelessWidget {
  final Future<List<Gecko>>? geckos;
  const FeaturedGeckos({Key? key, this.geckos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: geckos,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            !snapshot.hasData) {
          return Container();
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FeaturedGeckoCard(
                image: snapshot.data[3].thumbnail,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(image: snapshot.data[3].thumbnail),
                      ));
                },
              ),
              FeaturedGeckoCard(
                image: snapshot.data[5].thumbnail,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(image: snapshot.data[5].thumbnail),
                      ));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
