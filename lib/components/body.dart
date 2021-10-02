import 'package:flutter/material.dart';
import 'package:gecko_app/components/featured_geckos.dart';
import 'package:gecko_app/components/recommend_geckos.dart';
import 'package:gecko_app/components/title_with_more_btn.dart';
import 'package:gecko_app/constants.dart';
import 'header_with_searchbox.dart';
import 'package:gecko_app/database/dbhelper.dart';
import 'package:gecko_app/models/gecko.dart';

class Body extends StatelessWidget {
  Future getGeckoData() async {
    Gecko gecko = Gecko(id: 1, name: '푸들', age: 2, origin: 'korea');
    DBHelper().insertGecko(gecko);
    var dogs = DBHelper().geckos();
    return dogs;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(
            title: "Gecko",
            press: () {},
          ),
          RecommendGeckos(),
          Container(
            child: FutureBuilder(
              future: getGeckoData(),
              builder: (_, snapshot) {
                print(snapshot.data);
                return Text('hello');
              },
          )),
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
