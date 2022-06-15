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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("Settings"),
    );
  }
}
