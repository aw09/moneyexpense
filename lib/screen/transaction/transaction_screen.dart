import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/screen/transaction/components/body.dart';

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
            backgroundColor: whiteColor,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(10.0),
              child: buildAppBar(),
            ),
            body: SingleChildScrollView(
              child: Body(),
            )
        ),
//        CategoryScreen()
      ],

    );
  }
  AppBar buildAppBar(){
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
    );
  }
}
