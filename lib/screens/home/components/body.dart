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
      id: 1,
      name: 'Cutey',
      age: 2,
      origin: 'korea',
      color: 'yellow',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/yellow.jpeg",
      images: "img1, img2",
      ancestry: "2/",
    );
    Gecko gecko2 = Gecko(
      id: 2,
      name: '파랑이',
      age: 4,
      origin: 'Indonesia',
      color: 'blue',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/blue.png",
      images: "img1, img2",
      ancestry: "1/3/",
    );
    Gecko gecko3 = Gecko(
      id: 3,
      name: '오렌지',
      age: 1,
      origin: 'Brasil',
      color: 'orange',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/orange.jpeg",
      images: "img1, img2",
      ancestry: "1/2/4/",
    );
    Gecko gecko4 = Gecko(
      id: 4,
      name: '레모니',
      age: 2,
      origin: 'America',
      color: 'lemon',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/lemon_frost_resized.png",
      images: "img1, img2",
      ancestry: "1/2/3/",
    );
    Gecko gecko5 = Gecko(
      id: 5,
      name: '모니',
      age: 2,
      origin: 'America',
      color: 'lemon',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/lemon_frost_resized.png",
      images: "img1, img2",
      ancestry: "1/2/3/4/6/7/8/",
    );
    Gecko gecko6 = Gecko(
      id: 6,
      name: 'utey',
      age: 2,
      origin: 'korea',
      color: 'yellow',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/yellow.jpeg",
      images: "img1, img2",
      ancestry: "2/",
    );
    Gecko gecko7 = Gecko(
      id: 7,
      name: '랑이',
      age: 4,
      origin: 'Indonesia',
      color: 'blue',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/blue.png",
      images: "img1, img2",
      ancestry: "1/3/",
    );
    Gecko gecko8 = Gecko(
      id: 8,
      name: '렌지',
      age: 1,
      origin: 'Brasil',
      color: 'orange',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/orange.jpeg",
      images: "img1, img2",
      ancestry: "1/2/4/",
    );
    DBHelper().insertGecko(gecko);
    DBHelper().insertGecko(gecko2);
    DBHelper().insertGecko(gecko3);
    DBHelper().insertGecko(gecko4);
    DBHelper().insertGecko(gecko5);
    DBHelper().insertGecko(gecko6);
    DBHelper().insertGecko(gecko7);
    DBHelper().insertGecko(gecko8);
    var geckos = DBHelper().geckos();
    print(await geckos);
    return await geckos;
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
          TitleWithMoreBtn(
            title: "Featured Geckos",
            press: () {},
          ),
          FeaturedGeckos(),
          ListGecko(geckos: getGeckoData()),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
