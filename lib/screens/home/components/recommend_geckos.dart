import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/recommend_gecko_card.dart';
import 'package:gecko_app/models/gecko.dart';
import 'package:gecko_app/screens/details/details_screen.dart';

class RecommendGeckos extends StatelessWidget {
  final Future<List<Gecko>>? geckos;
  const RecommendGeckos({
    Key? key,
    this.geckos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: geckos,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            !snapshot.hasData) {
          return Container();
        }
        print(snapshot.hasData);
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
                              DetailsScreen(image: snapshot.data[0].thumbnail),
                        ));
                  },
                  country: snapshot.data[0].origin,
                  image: snapshot.data[0].thumbnail,
                  price: 200,
                  title: snapshot.data[0].name),
              RecommendGeckoCard(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(image: snapshot.data[1].thumbnail),
                        ));
                  },
                  country: snapshot.data[1].origin,
                  image: snapshot.data[1].thumbnail,
                  price: 400,
                  title: snapshot.data[1].name),
              RecommendGeckoCard(
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(image: snapshot.data[2].thumbnail),
                        ));
                  },
                  country: snapshot.data[2].origin,
                  image: snapshot.data[2].thumbnail,
                  price: 800,
                  title: snapshot.data[2].name),
            ],
          ),
        );
      },
    );
  }
}
