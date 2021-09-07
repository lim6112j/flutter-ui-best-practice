import 'package:flutter/material.dart';
import 'package:plant_app/components/featured_plant_card.dart';
class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FeaturedPlantCard(
            image: 'assets/images/bottom_img_1.png',
            press : () {},
          ),
          FeaturedPlantCard(
            image: 'assets/images/bottom_img_2.png',
            press : () {},
          ),
        ],
      ),
    );
  }
}
