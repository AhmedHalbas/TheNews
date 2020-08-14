import 'package:flutter/material.dart';
import '../screens/news_main_screen.dart';
import '../components/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Categories'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CategoryItem(
                    itemImage: 'images/sports_icon.png',
                    itemText: 'Sports',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(category: 'sports'),
                        ),
                      );
                    },
                  ),
                  CategoryItem(
                    itemImage: 'images/business_icon.png',
                    itemText: 'Business',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(category: 'business'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CategoryItem(
                    itemImage: 'images/entertainment_icon.png',
                    itemText: 'Entertainment',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(category: 'entertainment'),
                        ),
                      );
                    },
                  ),
                  CategoryItem(
                    itemImage: 'images/health_icon.png',
                    itemText: 'Health',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(category: 'health'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CategoryItem(
                    itemImage: 'images/science_icon.png',
                    itemText: 'Science',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(category: 'science'),
                        ),
                      );
                    },
                  ),
                  CategoryItem(
                    itemImage: 'images/technology_icon.png',
                    itemText: 'Technology',
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(category: 'technology'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
