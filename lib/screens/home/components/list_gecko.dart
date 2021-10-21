import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gecko_app/models/gecko.dart';
import 'package:gecko_app/screens/home/components/hero_detail_view.dart';
import 'package:gecko_app/screens/home/components/photo_hero.dart';
import 'package:gecko_app/state/GeckoModel.dart';

class ListGecko extends StatelessWidget {

  const ListGecko({
    Key? key, this.geckos,
  }) : super(key: key);

  final Future<List<Gecko>>? geckos;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot snapshot) {
        if(snapshot.connectionState == ConnectionState.none || !snapshot.hasData){
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 80 * (snapshot.data.length as int).toDouble(),
            child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(snapshot.data[index].name!),
                  subtitle: Text(snapshot.data[index].color!),
                  trailing: PhotoHero(img: snapshot.data[index].thumbnail,onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HeroDetailView(gecko: snapshot.data[index],);
                          },
                      ));
                  },),
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

