import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../utilities/constants.dart';
import 'package:share/share.dart';

class ArticleItem extends StatelessWidget {
  final String itemImageURL;
  final String itemTitle;
  final String itemDate;
  final String itemURL;

  ArticleItem({
    this.itemImageURL,
    this.itemTitle,
    this.itemDate,
    this.itemURL,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      colour: kActiveCardColour,
      cardChild: SizedBox(
        height: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: itemImageURL != null &&
                        Uri.parse(itemImageURL).isAbsolute
                    ? Image.network(
                        itemImageURL,
                        fit: BoxFit.fitWidth,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.black),
                            ),
                          );
                        },
                      )
                    : Image.asset('images/no_image_available.png')),
            SizedBox(height: 10),
            Flexible(
              child: Text(
                '$itemTitle\n\n$itemDate',
                style: kNumberTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            FlatButton(
              child: Icon(
                Icons.share,
                color: Colors.black,
              ),
              onPressed: () {
                Share.share(itemURL);
              },
            )
          ],
        ),
      ),
    );
  }
}
