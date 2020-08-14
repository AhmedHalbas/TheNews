import 'package:flutter/material.dart';
import 'package:globalnews/screens/news_loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0XFF191919),
        ),
      ),
      home: LoadingScreen(),
    );
  }
}
