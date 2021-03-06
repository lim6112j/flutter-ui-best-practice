import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gecko_app/database/MySqlHelper.dart';
import 'package:gecko_app/pages/placeholder_page.dart';
import 'package:gecko_app/screens/home/components/CustomSpinner.dart';
import 'package:gecko_app/screens/home/components/LoadingWidget.dart';
import 'package:gecko_app/screens/home/components/featured_geckos.dart';
import 'package:gecko_app/screens/home/components/fine_rich_text.dart';
import 'package:gecko_app/screens/home/components/header_with_scrollmenu.dart';
import 'package:gecko_app/screens/home/components/list_gecko.dart';
import 'package:gecko_app/screens/home/components/recommend_geckos.dart';
import 'package:gecko_app/screens/home/components/title_with_more_btn.dart';
import 'package:gecko_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:gecko_app/models/gecko.dart';
import '../../../state/ScrollModel.dart';
import 'package:http/http.dart' as http;
import 'package:gecko_app/utils/placeholder.dart';

class Body extends StatefulWidget {
  Body({Key? key, this.items}) : super(key: key);
  final List<String>? items;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ScrollController _controller = ScrollController();

  bool hidden = false;

  double prevOffset = 0;

  bool? increasing;

  ScrollModel? scrollModel;

  Future<List<Gecko>>? geckos;
  Timer? _debounce;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geckos = MySqlHelper().fetchGeckos();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("body is rerendering >>>>>>>>>>");
    //print("Geckos from api : $aGecko");
    scrollModel = context.read<ScrollModel>();
    _controller.addListener(_scrollListener);
    Size size = MediaQuery.of(context).size;
    //return buildSingleChildScrollView(size);
    return CustomScrollView(controller: _controller, slivers: [
      SliverAppBar(
        //excludeHeaderSemantics: true,
        automaticallyImplyLeading: true,
        floating: true,
        pinned: true,
        snap: true,
        centerTitle: true,
        title: Text('Gecko.com'),
        //leading: IconButton(
        //icon: SvgPicture.asset("assets/icons/menu.svg"),
        //onPressed: () {
        //Scaffold.of(context).openDrawer();
        //}),
        stretch: false,
        onStretchTrigger: () {
          // Function callback for stretch
          return Future<void>.value();
        },
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: const <StretchMode>[
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          centerTitle: true,
          title: const Text('Gecko World'),
          background: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                "assets/images/appbar.jpeg",
                fit: BoxFit.cover,
              ),
              const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.0, 0.5),
                    end: Alignment.center,
                    colors: <Color>[
                      Color(0x60000000),
                      Color(0x00000000),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(PlaceHolder.createRoute("cart"));
              },
              icon: Icon(Icons.shopping_cart))
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
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        //leading: IconButton(
        //icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {}),
        title: Container(
            width: double.infinity,
            height: 35,
            //decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(12.0),
            //color: Colors.white,
            //),
            //child: buildSearch()
            child: HeaderWithScrollMenu(size: size, items: widget.items!)
            //child: Row(
            //children: [Text("MyPage"), Text("Order")],
            //)
            ));
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
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 10.0) {
            Scaffold.of(context).openDrawer();
          } else if (details.primaryVelocity! < -10.0) {
            Navigator.of(context).push(PlaceHolder.createRoute("cart"));
          }
        },
        child: FutureBuilder(
            future: geckos,
            builder: (context, AsyncSnapshot snapshot) {
              //if (snapshot.connectionState == ConnectionState.none ||
              //!snapshot.hasData) {
              //return Padding(
              //padding: EdgeInsets.only(top: 100),
              //child: Center(
              //child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //children: const <Widget>[
              ////Image(
              ////image: AssetImage('assets/images/blue.png'),
              ////),
              //SizedBox(
              //width: 30,
              //height: 30,
              //child: CircularProgressIndicator(),
              //),
              //Padding(
              //padding: EdgeInsets.all(16),
              //child: Text('Awaiting Database...'),
              //)
              //],
              //),
              //),
              //);
              //}
              if (snapshot.connectionState == ConnectionState.active) {
                print("connectionState active");
              }
              return snapshot.connectionState == ConnectionState.done
                  ? snapshot.hasData
                      ? Column(
                          children: <Widget>[
                            //HeaderWithSearchBox(size: size),
                            //HeaderWithScrollMenu(size: size),
                            TitleWithMoreBtn(
                              title: "Gecko Rocks",
                              press: () {},
                            ),
                            RecommendGeckos(
                              //geckos: getGeckoData(),
                              geckos: snapshot.data,
                            ),
                            TitleWithMoreBtn(
                              title: "Featured Geckos",
                              press: () {},
                            ),
                            FeaturedGeckos(
                              geckos: snapshot.data,
                            ),
                            //ListGecko(geckos: getGeckoData()),
                            ListGecko(geckos: snapshot.data),
                            Padding(
                              padding: EdgeInsets.all(kDefaultPadding),
                              child: FineRichText(
                                message: homeBottomFineMessage,
                              ),
                            ),
                            SizedBox(height: kDefaultPadding),
                          ],
                        )
                      : Center(
                          child: InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text("Error Occurred , Tap to retry !"),
                            ),
                            onTap: () => setState(() {
                              geckos = MySqlHelper().fetchGeckos();
                            }),
                          ),
                        )
                  : Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: SizedBox(
                            width: 30,
                            height: 30,
                            child: CircularProgressIndicator()),
                      ),
                    );
            }),
      ),
    );
  }

  void _scrollListener() {
    //print("debounce.isActive : ${_debounce?.isActive}");
    //if (_debounce?.isActive ?? false) _debounce?.cancel();
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
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        hidden = true;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
        scrollModel?.changeHidden(true);
        print("reach the bottom");
      }
      if (_controller.offset <= -20) {
        hidden = false;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(false);
        setState(() {
          geckos = MySqlHelper().fetchGeckos();
        });
        scrollModel?.changeHidden(false);
        print("reach the top");
      }
    });
  }
}
