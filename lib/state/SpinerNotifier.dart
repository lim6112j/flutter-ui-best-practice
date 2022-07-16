import 'package:flutter/material.dart';

class SpinnerNotifier extends ChangeNotifier {
  bool _isVisible = false;
  bool get isVisible => _isVisible;
  void changeHidden(bool hiddenValue) {
    print("spinner changehidden called >>>>>>> $hiddenValue");
    _isVisible = hiddenValue;
    notifyListeners();
  }
}
