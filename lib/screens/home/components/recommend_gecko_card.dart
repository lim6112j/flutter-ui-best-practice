import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';

class RecommendGeckoCard extends StatelessWidget {
  const RecommendGeckoCard({
    required this.country,
    required this.title,
    required this.image,
    required this.press,
    required this.price,
    Key? key,
  }) : super(key: key);
  final String image, title, country;
  final int price;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding * 2.5),
        width: size.width * 0.4,
        child: Column(
          children: <Widget>[
            GestureDetector(
                onTap: press,
                child: Image.asset(image, height: 120, fit: BoxFit.fill)),
            GestureDetector(
              onTap: press,
              child: Container(
                padding: EdgeInsets.all(kDefaultPadding / 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.23)),
                    ]),
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "$title\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button),
                      TextSpan(
                          text: "$country".toUpperCase(),
                          style:
                              TextStyle(color: kPrimaryColor.withOpacity(0.5))),
                    ])),
                    Spacer(),
                    Text(
                      '\$$price',
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: kPrimaryColor),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
