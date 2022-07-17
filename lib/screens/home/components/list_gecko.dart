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

  final List<Gecko>? geckos;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: geckos!.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                title: Text(geckos![index].name!),
                subtitle: Text(geckos![index].color!),
                trailing: PhotoHero(
                  tagName: 'tag$index',
                  img: geckos![index].thumbnail,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) {
                        return HeroDetailView(
                          gecko: geckos![index],
                        );
                      },
                    ));
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
