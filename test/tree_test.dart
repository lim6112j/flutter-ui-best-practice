// Import the test package and Counter class
import 'package:flutter_test/flutter_test.dart';
void main() {

  List getPath(int  iN, List? p, List i, List r) {
    final int iterationNum = iN;
    final List? parent = p;
    final List input = i;
    final List result = r;
    if (input.length < 2) {
      // print('Too short input list');
      return result;
    }
    // print('this turn iteration : $iterationNum, input length : ${input.length}, parent length : ${parent!.length}, result len : ${result.length}');
    if(iterationNum > 0 && parent!.length ==0) return result;
    if (iterationNum == 0) {
      var res = result;
      var children = input.sublist(1);
      var parent = input.sublist(0,1);
      getPath(1, parent, children, res);
    }
    var subList = List.empty();
    if(input.length >= 2*parent!.length) {
      subList = input.sublist(0, 2*parent.length);
      for (var i = 0; i < parent.length; i++) {
        var pr = parent[i];
        var children = subList.sublist(i*2, (i+1)*2);
        // print('children length : ${children.length}');
        for (var j = 0; j < children.length ; j++) {
          result.add({"from": pr, "to": children[j]});
        }
      }
        // print('getpath calling !!!, iteration num : $iterationNum, input length : ${input.length}, parent length: ${parent.length}');
        getPath(iterationNum + 1, subList, input.sublist(2*parent.length), result);
    }
    return result;
  }
  var input = "11/1/2/3/0/4/0/5/6/7/8/0/10/0/0/1/2/3/4/5/6/7/8/9/10/11/12/13/14/15/16";
  var arr = input.split('/');
  //var result = getPath(0, [], arr, []);
  // print('input array length : ${arr.length}');
  //print(result);
  test('tree parsing', () {
      final val = getPath(0, [], arr, []);
      // print(val);
      expect(val.length, 30);
  });
}
