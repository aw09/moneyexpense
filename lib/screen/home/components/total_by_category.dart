import 'package:flutter/material.dart';
import 'package:moneyexpense/models/Category.dart';
import 'package:moneyexpense/screen/home/components/item_card.dart';
import 'package:provider/provider.dart';
import 'package:moneyexpense/transaction_provider.dart';

class TotalByCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    final value = provider.totalTransactionPerCategory;
    return Container(
      height: 130.0,
      child: ListView.builder(
          itemCount: value.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => ItemCard(
                category: categories[index],
                value: value[index],
              )),
    );
  }
}
