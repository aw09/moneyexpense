import 'package:flutter/cupertino.dart';
import 'package:moneyexpense/models/TransactionModel.dart';
import 'package:moneyexpense/helper/dbhelper.dart';
import 'package:moneyexpense/models/Category.dart';
import 'package:format_indonesia/format_indonesia.dart';

class TransactionProvider with ChangeNotifier {
  DbHelper dbHelper = DbHelper();
  Category _selected;
  DateTime _date = DateTime.now();
  List<TransactionModel> _transactions;
  List<TransactionModel> _todayTransactions;
  List<int> totalTransactionPerCategory;
  int totalToday;

  List<TransactionModel> get todayTransactions => _todayTransactions;

  set todayTransactions(List<TransactionModel> value) {
    _todayTransactions = value;
  }

  TransactionProvider() {
    _selected = categories[0];
    getListTransaction();
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  Category get selected => _selected;

  set selected(Category value) {
    _selected = value;
  }

  List<TransactionModel> get transactions {
    getListTransaction();
    return _transactions;
  }

  set transactions(List<TransactionModel> value) {
    _transactions = value;
  }

  void getListTransaction() async {
    _transactions = await dbHelper.getTransactionList();
    _todayTransactions = [];
    totalToday = 0;

    if (_transactions.length > 0) {
      for (int i = 0; i < _transactions.length; i++) {
        if (_transactions[i].date == Waktu(DateTime.now()).yMd()) {
          _todayTransactions.add(_transactions[i]);
          totalToday += _transactions[i].nominal;
        }
      }
    }
    totalTransactionPerCategory = [0, 0, 0, 0, 0, 0, 0, 0, 0];

    if (_todayTransactions != null) {
      for (int k = 0; k < 9; k++) {
        for (int i = 0; i < _todayTransactions.length; i++) {
          if (_todayTransactions[i].idCategory == (k + 1))
            totalTransactionPerCategory[k] += _todayTransactions[i].nominal;
        }
      }
    }
  }

  void addTransaction(TransactionModel object) async {
    getListTransaction();
    notifyListeners();
  }

  void changeCategory(Category category) {
    _selected = category;
    notifyListeners();
  }

  void changeDate(DateTime date) {
    _date = date;
    notifyListeners();
  }
}
