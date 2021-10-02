import 'package:flutter/material.dart';
import 'package:gecko_app/components/featured_geckos.dart';
import 'package:gecko_app/components/recommend_geckos.dart';
import 'package:gecko_app/components/title_with_more_btn.dart';
import 'package:gecko_app/constants.dart';
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
        mother: 2);
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
          SizedBox(
            height: 100,
              child: FutureBuilder(
                  future: getGeckoData(),
                  builder: (_, AsyncSnapshot<List<Gecko>> snapshot) {
                    return new ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) {
                        return new Text(snapshot.data![index].name.toString());
                      },
                    );
                  })),
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
