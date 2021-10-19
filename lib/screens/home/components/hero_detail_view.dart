import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/models/gecko.dart';
import 'package:gecko_app/screens/home/components/photo_hero.dart';
import 'package:gecko_app/screens/home/components/recommend_gecko_card.dart';

class HeroDetailView extends StatelessWidget {
  final String? img;
  final Gecko gecko;
  const HeroDetailView({
    Key? key,
    this.img,
    required this.gecko,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gecko.name != null ? gecko.name! : 'Gecko'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            // color: Colors.lightBlueAccent,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: PhotoHero(
              img: gecko.thumbnail,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23))
                ]),
                child: Row(children: [
                    RichText(text: TextSpan(
                        children: [
                          TextSpan(text: "${gecko.name}\n".toUpperCase(), style: Theme.of(context).textTheme.button),
                          TextSpan(text: "${gecko.origin}".toUpperCase(), style: TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                        ]
                    ),),
                    Spacer(),
                    Text('${gecko.age} years old', style: Theme.of(context).textTheme.button!.copyWith(color: kPrimaryColor))
                ],)
          )
        ],
      ),
    );
  }
}
