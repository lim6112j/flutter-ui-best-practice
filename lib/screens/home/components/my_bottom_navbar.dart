import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gecko_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:gecko_app/state/ScrollModel.dart';

class MyBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScrollModel>(
        builder: (context, model, child) =>
            buildContainer(context, model.hidden));
  }
}

AnimatedContainer buildContainer(BuildContext context, bool hidden) {
  return AnimatedContainer(
    height: hidden ? 0.0 : 60.0,
    duration: const Duration(milliseconds: 200),
    curve: Curves.fastOutSlowIn,
    child: Container(
        padding: EdgeInsets.only(
            left: kDefaultPadding * 2,
            right: kDefaultPadding * 2,
            bottom: kDefaultPadding / 2),
        height: 60,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 6,
              color: Colors.black.withOpacity(0.7),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_bag, color: Colors.white),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ColoredBox(
                          color: kPrimaryColor,
                          child: Center(
                            child: Text(
                              "My Geckos",
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                    });
              },
            ),
            IconButton(
              icon: Icon(Icons.manage_accounts, color: Colors.white),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ColoredBox(
                          color: kPrimaryColor,
                          child: Center(
                            child: Text(
                              "Login & My page",
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                    });
              },
            ),
            IconButton(
              icon: Icon(Icons.help, color: Colors.white),
              onPressed: () {
                final snackBar = SnackBar(
                  backgroundColor: kPrimaryColor,
                  content: const Text("Yay !!!!"),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: 'undo',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //showModalBottomSheet(
                //context: context,
                //builder: (context) {
                //return ColoredBox(
                //color: kPrimaryColor,
                //child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //children: [
                //Text(
                //"Settings",
                //style: TextStyle(color: Colors.white),
                //),
                //Text(
                //"Customizing settings",
                //style: TextStyle(color: Colors.white),
                //),
                //Text(
                //"you favorites",
                //style: TextStyle(color: Colors.white),
                //),
                //],
                //),
                //);
                //});
              },
            ),
          ],
        )),
  );
}
