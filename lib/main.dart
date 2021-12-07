import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utilities/app_theme.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? seen = prefs.getBool('seen');

  Widget _screen;
  if (seen == null || seen == false) {
    _screen = OnBoarding();
  } else {
    _screen = HomeScreen();
  }

  runApp(NewsApp(_screen));
}

class NewsApp extends StatelessWidget {
  final Widget screen;
  NewsApp(this.screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      home: this.screen,
      theme: AppTheme.appTheme,
      //theme of project news
    );
  }
}
