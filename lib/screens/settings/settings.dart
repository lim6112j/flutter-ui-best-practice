import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/header_with_scrollmenu.dart';
import 'package:gecko_app/screens/home/components/title_with_more_btn.dart';
import 'package:gecko_app/constants.dart';
import 'package:provider/provider.dart';
import '../../../state/ScrollModel.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ScrollController _controller = ScrollController();

  bool hidden = false;

  double prevOffset = 0;

  bool? increasing;

  ScrollModel? scrollModel;

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    scrollModel = context.read<ScrollModel>();
    _controller.addListener(_scrollListener);
    Size size = MediaQuery.of(context).size;
    //return buildSingleChildScrollView(size);
    return CustomScrollView(controller: _controller, slivers: [
      SliverAppBar(
        floating: true,
        pinned: true,
        snap: false,
        centerTitle: false,
        title: Text('Gecko.com'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
        bottom: buildAppBar(size),
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(child: buildSingleChildScrollView(size)),
        ]),
      ),
    ]);
  }

  AppBar buildAppBar(size) {
    return AppBar(
        backgroundColor: kPrimaryColor,
        //leading: IconButton(
        //icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
        title: Container(
            width: double.infinity,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            //child: buildSearch()
            child: HeaderWithScrollMenu(size: size)));
  }

  void _scrollListener() {
    //print("debounce.isActive : ${_debounce?.isActive}");
    //if (_debounce?.isActive ?? false) _debounce?.cancel();
    Timer(const Duration(milliseconds: 100), () {
      if (_controller.offset <= prevOffset - 10 && (increasing ?? true)) {
        hidden = false;
        increasing = false;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(false);
        scrollModel?.changeHidden(false);
        print("value of hidden : $hidden");
      } else if (_controller.offset >= prevOffset + 10 &&
          !(increasing ?? false)) {
        hidden = true;
        increasing = true;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
        scrollModel?.changeHidden(true);
        print("value of hidden : $hidden");
      }
      prevOffset = _controller.offset;
    });

    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      hidden = true;
      //Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
      scrollModel?.changeHidden(true);
      print("reach the bottom");
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      hidden = false;
      //Provider.of<ScrollModel>(context, listen: false).changeHidden(false);
      scrollModel?.changeHidden(false);
      print("reach the top");
    }
  }

  SingleChildScrollView buildSingleChildScrollView(Size size) {
    return SingleChildScrollView(
      child: mainPage(),
    );
  }

  Column mainPage() {
    return Column(
      children: <Widget>[
        //HeaderWithSearchBox(size: size),
        //HeaderWithScrollMenu(size: size),
        TitleWithMoreBtn(
          title: "Gecko Rocks",
          press: () {},
        ),
        SizedBox(height: kDefaultPadding),
      ],
    );
  }
}
