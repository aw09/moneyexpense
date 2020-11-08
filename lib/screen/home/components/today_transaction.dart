import 'package:flutter/material.dart';
import 'package:moneyexpense/models/TransactionModel.dart';
import 'package:moneyexpense/screen/home/components/item_today_transaction.dart';
import 'package:moneyexpense/transaction_provider.dart';
import 'package:provider/provider.dart';

class TodayTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    List<TransactionModel> today = provider.todayTransactions;

    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.centerLeft,
              child: Text('Hari ini', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            Container(
              width: 300,
              height: 400,
              child: ListView.builder(
                itemCount: today.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>
                    ItemTodayTransaction(
                      today: today[index],
                    ),
              ),
            )
          ],

        ));
  }
}
