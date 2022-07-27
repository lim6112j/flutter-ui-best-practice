import 'package:flutter/material.dart';
import 'package:gecko_app/pages/add_gecko_page.dart';
import 'package:gecko_app/pages/placeholder_page.dart';

class PlaceHolder {
  static Route createRoute(String title) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PlaceholderPage(title: title),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  static Route createRouteVertical(String title) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AddGeckoPage(title: title),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
