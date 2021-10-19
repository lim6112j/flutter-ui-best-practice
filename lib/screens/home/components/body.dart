import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/featured_geckos.dart';
import 'package:gecko_app/screens/home/components/hero_detail_view.dart';
import 'package:gecko_app/screens/home/components/list_gecko.dart';
import 'package:gecko_app/screens/home/components/photo_hero.dart';
import 'package:gecko_app/screens/home/components/recommend_geckos.dart';
import 'package:gecko_app/screens/home/components/title_with_more_btn.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/state/GeckoModel.dart';
import 'package:provider/provider.dart';
import 'header_with_searchbox.dart';
import 'package:gecko_app/database/dbhelper.dart';
import 'package:gecko_app/models/gecko.dart';

class Body extends StatelessWidget {
  Future<List<Gecko>> getGeckoData() async {
    Gecko gecko = Gecko(
        id: 2,
        name: '푸들',
        age: 2,
        origin: 'korea',
        color: 'red',
        father: 1,
        mother: 2,
        thumbnail: "assets/images/blue.png",
        images: "img1, img2"
      );
    DBHelper().insertGecko(gecko);
    var dogs = DBHelper().geckos();
    return dogs;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    var gecko = context.watch<GeckoModel>();
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(
            title: "Gecko",
            press: () {},
          ),
          RecommendGeckos(
            geckos: getGeckoData(),
          ),
          ListGecko(gecko: gecko),
          TitleWithMoreBtn(
            title: "Featured Geckos",
            press: () {},
          ),
          FeaturedGeckos(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}

