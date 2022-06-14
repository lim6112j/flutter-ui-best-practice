import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gecko_app/screens/home/components/featured_geckos.dart';
import 'package:gecko_app/screens/home/components/header_with_scrollmenu.dart';
import 'package:gecko_app/screens/home/components/list_gecko.dart';
import 'package:gecko_app/screens/home/components/recommend_geckos.dart';
import 'package:gecko_app/screens/home/components/title_with_more_btn.dart';
import 'package:gecko_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:gecko_app/database/SqfliteHelper.dart';
import 'package:gecko_app/models/gecko.dart';

import '../../../state/ScrollModel.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _controller = ScrollController();

  bool hidden = false;

  double prevOffset = 0;

  bool? increasing;

  ScrollModel? scrollModel;

  Future<List<Gecko>> getGeckoData() async {
    Gecko gecko = Gecko(
      id: 1,
      name: 'Cutey',
      age: 2,
      origin: 'korea',
      color: 'yellow',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/yellow.jpeg",
      images: "img1, img2",
      ancestry: "2/",
    );
    Gecko gecko2 = Gecko(
      id: 2,
      name: '파랑이',
      age: 4,
      origin: 'Indonesia',
      color: 'blue',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/blue.png",
      images: "img1, img2",
      ancestry: "1/3/",
    );
    Gecko gecko3 = Gecko(
      id: 3,
      name: '오렌지',
      age: 1,
      origin: 'Brasil',
      color: 'orange',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/orange.jpeg",
      images: "img1, img2",
      ancestry: "1/2/4/",
    );
    Gecko gecko4 = Gecko(
      id: 4,
      name: '레모니',
      age: 2,
      origin: 'America',
      color: 'lemon',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/lemon_frost_resized.png",
      images: "img1, img2",
      ancestry: "1/2/3/",
    );
    Gecko gecko5 = Gecko(
      id: 5,
      name: '모니',
      age: 2,
      origin: 'America',
      color: 'lemon',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/lemon_frost_resized.png",
      images: "img1, img2",
      ancestry: "1/2/3/4/6/7/8/",
    );
    Gecko gecko6 = Gecko(
      id: 6,
      name: 'utey',
      age: 2,
      origin: 'korea',
      color: 'yellow',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/yellow.jpeg",
      images: "img1, img2",
      ancestry: "2/",
    );
    Gecko gecko7 = Gecko(
      id: 7,
      name: '랑이',
      age: 4,
      origin: 'Indonesia',
      color: 'blue',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/blue.png",
      images: "img1, img2",
      ancestry: "1/3/",
    );
    Gecko gecko8 = Gecko(
      id: 8,
      name: '렌지',
      age: 1,
      origin: 'Brasil',
      color: 'orange',
      father: 1,
      mother: 2,
      thumbnail: "assets/images/orange.jpeg",
      images: "img1, img2",
      ancestry: "1/2/4/",
    );
    var initiaize = true;
    if (initiaize) {
      var geckos = await SqfliteHelper().geckos();
      for (var gecko in geckos) {
        SqfliteHelper().deleteGecko(gecko.id!);
      }
    }
    SqfliteHelper().insertGecko(gecko);
    SqfliteHelper().insertGecko(gecko2);
    SqfliteHelper().insertGecko(gecko3);
    SqfliteHelper().insertGecko(gecko4);
    SqfliteHelper().insertGecko(gecko5);
    SqfliteHelper().insertGecko(gecko6);
    SqfliteHelper().insertGecko(gecko7);
    SqfliteHelper().insertGecko(gecko8);
    var geckos = SqfliteHelper().geckos();
    //print(await geckos);
    return await geckos;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("body is rerendering >>>>>>>>>>");
    scrollModel = context.read<ScrollModel>();
    _controller.addListener(_scrollListener);
    Size size = MediaQuery.of(context).size;
    //return buildSingleChildScrollView(size);
    return CustomScrollView(controller: _controller, slivers: [
      SliverAppBar(
        floating: true,
        pinned: false,
        snap: false,
        centerTitle: false,
        title: Text('Gecko.com'),
        leading: IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
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

  Center buildSearch() {
    return Center(
      child: TextField(
        decoration: InputDecoration(
            hintText: "Search for Something",
            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.camera_alt)),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(Size size) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //HeaderWithSearchBox(size: size),
          //HeaderWithScrollMenu(size: size),
          TitleWithMoreBtn(
            title: "Gecko Rocks",
            press: () {},
          ),
          RecommendGeckos(
            geckos: getGeckoData(),
          ),
          TitleWithMoreBtn(
            title: "Featured Geckos",
            press: () {},
          ),
          FeaturedGeckos(),
          ListGecko(geckos: getGeckoData()),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
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
      } else if (_controller.offset >= prevOffset + 10 &&
          !(increasing ?? false)) {
        hidden = true;
        increasing = true;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
        scrollModel?.changeHidden(true);
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
}
