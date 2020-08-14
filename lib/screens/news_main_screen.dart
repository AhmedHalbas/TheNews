import 'package:flutter/material.dart';
import 'package:globalnews/services/article.dart';
import '../services/networking.dart';
import '../components/internet_connection.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../components/article_item.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  final String category;
  MainScreen({this.category});
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool showSpinner = false;
  Text title;
  List<Article> articles = [];

  void getData() async {
    setState(() {
      showSpinner = true;
    });

    articles = await NetworkHelper(
            'https://newsapi.org/v2/top-headlines?category=${widget.category}&pageSize=50&apiKey=3d5ac9894af14a73a79ec7019e027a42')
        .getData();

    checkInternet(context, articles);


    setState(() {
      showSpinner = false;
    });

    setState(() {
      title = Text(
          '${widget.category[0].toUpperCase()}${widget.category.substring(1)} News');
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: ModalProgressHUD(
        color: Colors.black,
        inAsyncCall: showSpinner,
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, position) {
              return ArticleItem(
                itemImageURL: articles[position].urlToImage,
                itemTitle: articles[position].title,
                itemDate:
                    '${DateFormat("dd.MM.yyyy HH:mm").format(DateTime.parse(articles[position].publishedAt))} GMT',
                itemURL: articles[position].url,
              );
            }),
      ),
    );
  }
}
