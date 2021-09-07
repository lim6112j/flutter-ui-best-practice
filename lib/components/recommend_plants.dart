import 'package:flutter/material.dart';
import 'package:plant_app/components/recommend_plant_card.dart';
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
            press: () {},
            country: 'rusia',
            image: 'assets/images/image_1.png',
            price: 200,
            title: "ben lim"
          ),
          RecommendPlantCard(
            press: () {},
            country: 'korea',
            image: 'assets/images/image_2.png',
            price: 400,
            title: "samantha"
          ),
          RecommendPlantCard(
            press: () {},
            country: 'Japan',
            image: 'assets/images/image_3.png',
            price: 800,
            title: "nakamura"
          ),
        ],
      ),
    );
  }
}
