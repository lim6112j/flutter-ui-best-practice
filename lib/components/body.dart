import 'package:flutter/material.dart';
import 'package:gecko_app/components/featured_geckos.dart';
import 'package:gecko_app/components/recommend_geckos.dart';
import 'package:gecko_app/components/title_with_more_btn.dart';
import 'package:gecko_app/constants.dart';
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
          RecommendGeckos(),
          TitleWithMoreBtn(title: "Featured Geckos", press: () {},),
          FeaturedGeckos(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}

