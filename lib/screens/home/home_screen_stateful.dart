import 'package:flutter/material.dart';
import 'package:gecko_app/screens/home/components/body.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/screens/home/components/my_bottom_navbar_stateful.dart';

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

  void _scrollListener() {
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
    //if (_controller!.offset >= prevOffset) {
    //setState(() {
    //hidden = false;
    //print("value of hidden : ${hidden}");
    //});
    //} else {
    //setState(() {
    //hidden = true;
    //print("value of hidden : ${hidden}");
    //});
    //}
    //prevOffset = _controller!.offset;
  }
}
