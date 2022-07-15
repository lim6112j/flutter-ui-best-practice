import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> children;
    children = const <Widget>[
      //Image(
      //image: AssetImage('assets/images/blue.png'),
      //),
      SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Text('Awaiting Database...'),
      )
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
