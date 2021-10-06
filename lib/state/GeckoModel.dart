import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gecko_app/models/gecko.dart';

class GeckoModel extends ChangeNotifier {
  final List<Gecko> _geckos = [
    Gecko(id: 1, name: "gecko1", age: 3, color: "red", origin: "korea", father: 3, mother: 4, thumbnail: "assets/images/blue.png"),
    Gecko(id: 2, name: "gecko2", age: 3, color: "red", origin: "korea", father: 3, mother: 4, thumbnail: "assets/images/orange.jpeg"),
  ];
  UnmodifiableListView<Gecko> get geckos => UnmodifiableListView(_geckos);
  int get totalPrice => _geckos.length * 43;
  void add (Gecko gecko) {
    _geckos.add(gecko);
    notifyListeners();
  }
  void removeAll(){
    _geckos.clear();
    notifyListeners();
  }
}
