import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gecko_app/constants.dart';
import 'package:path/path.dart';

class HeaderWithScrollMenu extends StatelessWidget {
  const HeaderWithScrollMenu({
    Key? key,
    required this.size,
  });
  final Size size;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(
            left: kDefaultPadding / 2, right: kDefaultPadding / 2),
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          TextMenu(context, "MyPage"),
          TextMenu(context, "News"),
          TextMenu(context, "Bid"),
          TextMenu(context, "Order"),
          TextMenu(context, "Tracking"),
          TextMenu(context, "Help"),
          TextMenu(context, "More")
        ]));
  }

  Widget TextMenu(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "$title\n",
              style: TextStyle(
                fontSize: 12,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              )),
        ]),
      ),
    );
  }
}