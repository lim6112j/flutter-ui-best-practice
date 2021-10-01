import 'package:flutter/material.dart';
import 'package:plant_app/components/recommend_plant_card.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/details/details_screen.dart';
class RecommendPlants extends StatelessWidget {
  const RecommendPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommendPlantCard(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                )
              );
            },
            country: 'rusia',
            image: 'assets/images/blue.png',
            price: 200,
            title: "ben lim"
          ),
          RecommendPlantCard(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
                )
              );
            },
            country: 'korea',
            image: 'assets/images/orange.jpeg',
            price: 400,
            title: "samantha"
          ),
          RecommendPlantCard(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(),
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
