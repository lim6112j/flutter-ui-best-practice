import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/body.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar.dart';
import 'package:gecko_app/state/ScrollModel.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class HomeScreenStateful extends StatefulWidget {
  const HomeScreenStateful({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenStatefulState();
  }
}

class HomeScreenStatefulState extends State<HomeScreenStateful> {
  ScrollController? _controller;
  bool hidden = false;
  double prevOffset = 0;
  Timer? _debounce;
  @override
  void initState() {
    _controller = ScrollController();
    _controller!.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Body(controller: _controller!),
        bottomNavigationBar: MyBottomNavBar());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _debounce?.cancel();
    super.dispose();
  }

  void _scrollListener() {
    //print("debounce.isActive : ${_debounce?.isActive}");
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 40), () {
      print("debounce!!");
      if (_controller!.offset <= prevOffset) {
        hidden = false;
        Provider.of<ScrollModel>(context, listen: false).changeHidden(false);
        print("value of hidden : ${hidden}");
      } else {
        hidden = true;
        Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
        print("value of hidden : ${hidden}");
      }
      prevOffset = _controller!.offset;
    });

    if (_controller!.offset >= _controller!.position.maxScrollExtent &&
        !_controller!.position.outOfRange) {
      hidden = true;
      Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
      print("reach the bottom");
    }
    if (_controller!.offset <= _controller!.position.minScrollExtent &&
        !_controller!.position.outOfRange) {
      hidden = false;
      Provider.of<ScrollModel>(context, listen: false).changeHidden(false);
      print("reach the top");
    }
  }
}
