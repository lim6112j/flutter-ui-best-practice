import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/body.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar_stateful.dart';
import 'dart:async';

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
  String? message;
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
        bottomNavigationBar: MyBottomNavBarStateful(hidden: hidden));
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
    _debounce = Timer(const Duration(milliseconds: 400), () {
      print("debounce!!");
      if (_controller!.offset <= prevOffset) {
        setState(() {
          hidden = false;
          print("value of hidden : ${hidden}");
        });
      } else {
        setState(() {
          hidden = true;
          print("value of hidden : ${hidden}");
        });
      }
      prevOffset = _controller!.offset;
    });

    if (_controller!.offset >= _controller!.position.maxScrollExtent &&
        !_controller!.position.outOfRange) {
      setState(() {
        message = "reach the bottom";
        hidden = true;
        print("reach the bottom");
      });
    }
    if (_controller!.offset <= _controller!.position.minScrollExtent &&
        !_controller!.position.outOfRange) {
      setState(() {
        message = "reach the top";
        hidden = false;
        print("reach the top");
      });
    }
  }
}
