import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/screen/home/components/body.dart';
import 'package:moneyexpense/screen/transaction/transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  @override


  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(10.0),
          child: buildAppBar(),
        ),
        body: SingleChildScrollView(
          child: Body(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransactionScreen()),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: defaultColor,
      elevation: 0,
    );
  }
}
