import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/models/Category.dart';
import 'package:moneyexpense/models/TransactionModel.dart';

class ItemTodayTransaction extends StatelessWidget {
  final TransactionModel today;

  const ItemTodayTransaction({
    Key key,
    this.today,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          getCircleIcon(
              getIconData(today.idCategory), defaultColor, whiteColor),
          Expanded(child: Container(child: Text(today.transactionName))),
          Text('Rp ${today.nominal}', style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
