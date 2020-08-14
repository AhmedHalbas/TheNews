import 'package:flutter/material.dart';
import '../components/reusable_card.dart';
import '../utilities/constants.dart';

class CategoryItem extends StatelessWidget {
  final String itemImage;
  final String itemText;
  final Function onPress;

  CategoryItem({
    @required this.itemImage,
    @required this.itemText,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        colour: kActiveCardColour,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Image.asset(
                itemImage,
                width: 100,
                height: 100,
              ),
            ),
            Text(
              itemText,
              style: kLabelTextStyle,
            ),
          ],
        ),
        onPress: onPress,
      ),
    );
  }
}
