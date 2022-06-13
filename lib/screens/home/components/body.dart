import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/featured_geckos.dart';
import 'package:gecko_app/screens/home/components/header_with_scrollmenu.dart';
import 'package:gecko_app/screens/home/components/list_gecko.dart';
import 'package:gecko_app/screens/home/components/recommend_geckos.dart';
import 'package:gecko_app/screens/home/components/title_with_more_btn.dart';
import 'package:gecko_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:gecko_app/database/SqfliteHelper.dart';
import 'package:gecko_app/models/gecko.dart';

import '../../../state/ScrollModel.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    var initiaize = true;
    if (initiaize) {
      var geckos = await SqfliteHelper().geckos();
      for (var gecko in geckos) {
        SqfliteHelper().deleteGecko(gecko.id!);
      }
    }
    SqfliteHelper().insertGecko(gecko);
    SqfliteHelper().insertGecko(gecko2);
    SqfliteHelper().insertGecko(gecko3);
    SqfliteHelper().insertGecko(gecko4);
    SqfliteHelper().insertGecko(gecko5);
    SqfliteHelper().insertGecko(gecko6);
    SqfliteHelper().insertGecko(gecko7);
    SqfliteHelper().insertGecko(gecko8);
    var geckos = SqfliteHelper().geckos();
    //print(await geckos);
    return await geckos;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: mainPage(),
    );
  }

  Column mainPage() {
    return Column(
      children: <Widget>[
        //HeaderWithSearchBox(size: size),
        //HeaderWithScrollMenu(size: size),
        TitleWithMoreBtn(
          title: "Gecko Rocks",
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
    );
  }
}
