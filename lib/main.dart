import 'package:flutter/material.dart';
import 'package:gecko_app/constants.dart';
import 'package:gecko_app/screens/home/home_screen.dart';
import 'package:gecko_app/state/GeckoModel.dart';
import 'package:gecko_app/state/ScrollModel.dart';
import 'package:gecko_app/state/SpinerNotifier.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  const devType = String.fromEnvironment('TYPE');
  if (devType == 'development') {
    await dotenv.load(fileName: '.env.local');
  } else if (devType == 'test') {
    await dotenv.load(fileName: ".env.test");
  } else if (devType == 'raspberry') {
    await dotenv.load(fileName: ".env.raspberry");
  } else if (devType == 'raspberry-remote') {
    await dotenv.load(fileName: ".env.raspberry.remote");
  } else {
    dotenv.load(fileName: ".env.raspberry.remote");
  }
  // TODO remove GeckoModel ??
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => GeckoModel()),
    ChangeNotifierProvider(create: (context) => ScrollModel()),
    ChangeNotifierProvider(create: (context) => SpinnerNotifier())
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
      home: HomeScreen(),
    );
  }
}
