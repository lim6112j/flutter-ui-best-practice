import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:gecko_app/state/GeckoModel.dart';

void main() {
  test('adding item increases total cost', () {
    final nav = BottomNavHide();
    final hidden = nav.hidden;
    nav.addListener(() {
      expect(nav.hidden, equals(hidden));
    });
    nav.changeHidden();
  });
}
