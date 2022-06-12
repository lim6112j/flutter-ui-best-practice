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
  bool? increasing;
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
    _controller?.dispose();
    super.dispose();
  }

  void _scrollListener() {
    //print("debounce.isActive : ${_debounce?.isActive}");
    final scrollModel = context.read<ScrollModel>();
    //if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      if (_controller!.offset <= prevOffset - 10 && (increasing ?? true)) {
        hidden = false;
        increasing = false;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(false);
        scrollModel.changeHidden(false);
        print("value of hidden : ${hidden}");
      } else if (_controller!.offset >= prevOffset + 10 &&
          !(increasing ?? false)) {
        hidden = true;
        increasing = true;
        //Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
        scrollModel.changeHidden(true);
        print("value of hidden : ${hidden}");
      }
      prevOffset = _controller!.offset;
    });

    if (_controller!.offset >= _controller!.position.maxScrollExtent &&
        !_controller!.position.outOfRange) {
      hidden = true;
      //Provider.of<ScrollModel>(context, listen: false).changeHidden(true);
      scrollModel.changeHidden(true);
      print("reach the bottom");
    }
    if (_controller!.offset <= _controller!.position.minScrollExtent &&
        !_controller!.position.outOfRange) {
      hidden = false;
      //Provider.of<ScrollModel>(context, listen: false).changeHidden(false);
      scrollModel.changeHidden(false);
      print("reach the top");
    }
  }
}
