import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';

class HeaderWithScrollMenu extends StatelessWidget {
  const HeaderWithScrollMenu(
      {Key? key, required this.size, required this.items});
  final Size size;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(
            left: kDefaultPadding / 2, right: kDefaultPadding / 2),
        scrollDirection: Axis.horizontal,
        child: Row(
          children:
              items.map<Widget>((item) => textMenu(context, item)).toList(),
        )
        //child: Row(children: [
        //textMenu(context, "MyPage"),
        //textMenu(context, "News"),
        //textMenu(context, "Bid"),
        //textMenu(context, "Order"),
        //textMenu(context, "Tracking"),
        //])
        );
  }

  Widget textMenu(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "$title\n",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ]),
      ),
    );
  }
}
