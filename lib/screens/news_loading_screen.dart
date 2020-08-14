import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../components/internet_connection.dart';
import '../screens/news_categories_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void checkAndNavigate() {
    checkInternetLoading(context);

    Future(() {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return CategoriesScreen();
              }), (_) => false));
    });
  }

  @override
  void initState() {
    super.initState();
    checkAndNavigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80,
        ),
      ),
    );
  }
}
