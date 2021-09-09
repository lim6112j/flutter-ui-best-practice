import 'package:flutter/material.dart';
import 'package:plant_app/components/featured_plants.dart';
import 'package:plant_app/components/recommend_plants.dart';
import 'package:plant_app/components/title_with_more_btn.dart';
import 'package:plant_app/constants.dart';
import 'header_with_searchbox.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column (
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Gecko", press: () {},),
          RecommendPlants(),
          TitleWithMoreBtn(title: "Featured Plants", press: () {},),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}

