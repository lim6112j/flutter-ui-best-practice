import 'package:gecko_app/models/gecko.dart';
class Tree {
  Gecko gecko = new Gecko();
  Tree? _left;
  Tree? get left => _left;
  set left(Tree? left) => _left = left;
  Tree? _right;
  Tree? get right => _right;
  set right(Tree? right) => _right = right;
  @override
  String toString() {
    String? name = this.gecko.name;
    return (name != null ? name : 'null')  + " " + this.left.toString() + " " +this.right.toString();
  }
}
