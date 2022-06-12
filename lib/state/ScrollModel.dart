import 'package:flutter/material.dart';

class ScrollModel extends ChangeNotifier {
  bool _hidden = false;
  bool get hidden => _hidden;
  void changeHidden(bool hiddenValue) {
    print("scroll model changehidden called >>>>>>>");
    _hidden = hiddenValue;
    notifyListeners();
  }
}
