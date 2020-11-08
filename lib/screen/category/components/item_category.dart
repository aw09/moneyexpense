import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/models/Category.dart';



class ItemCategory extends StatelessWidget {
  final Category category;
  final Function press;
  const ItemCategory({
    Key key,
    this.category,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Column(
          children: <Widget>[
            getCircleIcon(category.iconData, defaultColor, whiteColor, size: 15, press: press),
            RichText(
              text: TextSpan(
                text: category.name,
                style: TextStyle(color: greyColor,fontSize: 15)
              ),
            ),
          ],
        ),
      ),

    );
  }
}
