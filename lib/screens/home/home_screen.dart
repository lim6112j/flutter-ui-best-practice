import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gecko_app/pages/amber_page.dart';
import 'package:gecko_app/pages/blue_page.dart';
import 'package:gecko_app/pages/new_page.dart';
import 'package:gecko_app/pages/pink_page.dart';
import 'package:gecko_app/pages/red_page.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar.dart';
import 'package:gecko_app/state/ScrollModel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _controller;
  double prevOffset = 0;

  ScrollModel? scrollModel;
  bool? increasing;
  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller!.addListener(_scrollListener);
    scrollModel = context.read<ScrollModel>();
    print("home_screen rendering ....");
    return Scaffold(
      body: NestedScrollView(
        controller: _controller,
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                title: Text(widget.title!),
                pinned: true,
                floating: true,
                snap: false,
                shadowColor: Colors.white,
                forceElevated: innerBoxIsScrolled,
                bottom: TabBar(
                  tabs: <Tab>[
                    Tab(
                      text: "page1",
                    ),
                    Tab(
                      text: "page2",
                    ),
                    Tab(text: "page3")
                  ],
                  controller: _tabController,
                ))
          ];
        }),
        body: TabBarView(
          controller: _tabController,
          children: [NewPage(), RedPage(), AmberPage()],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  void _scrollListener() async {
    //print("debounce.isActive : ${_debounce?.isActive}");
    //if (_debounce?.isActive ?? false) _debounce?.cancel();
    Timer(const Duration(milliseconds: 100), () {
      if (_controller!.offset <= prevOffset - 10 && (increasing ?? true)) {
        print("inceasing $increasing");
        increasing = false;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(false);
        scrollModel?.changeHidden(false);
      } else if (_controller!.offset >= prevOffset + 10 &&
          !(increasing ?? false)) {
        print("inceasing $increasing");
        increasing = true;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
        scrollModel?.changeHidden(true);
      }
      prevOffset = _controller!.offset;
    });
  }
}
