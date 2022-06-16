import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gecko_app/pages/placeholder_page.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                Navigator.of(context).push(_createRoute());
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
            Navigator.of(context).push(_createRoute());
          }
        },
        child: Column(
          children: <Widget>[
            //HeaderWithSearchBox(size: size),
            //HeaderWithScrollMenu(size: size),
            TitleWithMoreBtn(
              title: "Gecko Rocks",
              press: () {},
            ),
            RecommendGeckos(
              //geckos: getGeckoData(),
              geckos: fetchGeckos(),
            ),
            TitleWithMoreBtn(
              title: "Featured Geckos",
              press: () {},
            ),
            FeaturedGeckos(),
            //ListGecko(geckos: getGeckoData()),
            ListGecko(geckos: fetchGeckos()),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: FineRichText(
                message: homeBottomFineMessage,
              ),
            ),
            SizedBox(height: kDefaultPadding),
          ],
        ),
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

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        PlaceholderPage(title: "cart"),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

Future<List<Gecko>> fetchGeckos() async {
  //print("current api port    is   $port");
  //print("current api uri    is   ${dotenv.env['URL']}");
  //print("current api path    is   ${dotenv.env['GECKOS']}");
  String uriStr =
      '${dotenv.env['URL']}:${dotenv.env['PORT']}/${dotenv.env['GECKOS']}';
  Uri uri = Uri.parse(uriStr);
  //print("total uri is ${uri.toString()}");
  var responses = await http.get(uri).catchError((e) async {
    print("error !!! $e");
  });
  //print("responses status code : ${responses.statusCode}");
  if (responses.statusCode == 200) {
    //print("ress is $ress");
    return compute(parseGeckos, responses.body);
  } else {
    throw Exception('Failed load gecko');
  }
}

List<Gecko> parseGeckos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Gecko>((json) => Gecko.fromJson(json)).toList();
}
