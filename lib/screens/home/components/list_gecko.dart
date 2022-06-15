import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/models/gecko.dart';
import 'package:gecko_app/screens/home/components/hero_detail_view.dart';
import 'package:gecko_app/screens/home/components/photo_hero.dart';

class ListGecko extends StatelessWidget {
  const ListGecko({
    Key? key,
    this.geckos,
  }) : super(key: key);

  final Future<List<Gecko>>? geckos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            !snapshot.hasData) {
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: 90 * (snapshot.data.length as int).toDouble(),
            child: ListView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  title: Text(snapshot.data[index].name!),
                  subtitle: Text(snapshot.data[index].color!),
                  trailing: PhotoHero(
                    tagName: 'tag$index',
                    img: snapshot.data[index].thumbnail,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) {
                          return HeroDetailView(
                            gecko: snapshot.data[index],
                          );
                        },
                      ));
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
      future: geckos,
    );
  }
}
