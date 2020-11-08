import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/screen/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:moneyexpense/transaction_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // StatelessWidget turns this class into a widget
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TransactionProvider(),
        child: MaterialApp(color: whiteColor, home: HomeScreen()));
  }
}
