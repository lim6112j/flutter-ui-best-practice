import 'package:flutter_test/flutter_test.dart';
import 'package:gecko_app/class/tree.dart';
import 'package:gecko_app/models/gecko.dart';
void main() {
  test('tree class test', () {
      var aTree = new Tree();
      aTree.gecko = new Gecko(name: 'lim');
      aTree.left = new Tree();
      aTree.left?.gecko = new Gecko(name: 'mom');
      aTree.right = new Tree();
      aTree.right?.gecko = new Gecko(name: "papa");
      print(aTree.toString());
      expect(aTree.toString(), "lim mom null null papa null null");
  });
}
