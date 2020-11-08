import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/models/Category.dart';

class ItemCard extends StatelessWidget {
  final Category category;
  final int value;

  const ItemCard({
    Key key,
    this.category,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(right: defaultPadding, bottom: defaultPadding * 0.2),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          top: defaultPadding * 0.5, bottom: defaultPadding * 0.5),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getCircleIcon(category.iconData, whiteColor, defaultColor),
          Container(
            padding: EdgeInsets.only(
                left: defaultPadding, right: defaultPadding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(category.name),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Rp " + value.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
