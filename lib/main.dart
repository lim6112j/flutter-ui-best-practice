import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/screens/home/home_screen.dart';
import 'package:gecko_app/state/GeckoModel.dart';
import 'package:gecko_app/state/ScrollModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => GeckoModel()),
    ChangeNotifierProvider(create: (context) => ScrollModel()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gecko App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: MaterialColor(kPrimaryColor.value, color),
      ),
      home: HomeScreen(
        title: "Gecko Home",
      ),
    );
  }
}
