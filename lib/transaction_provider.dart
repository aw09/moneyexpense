import 'package:flutter/cupertino.dart';
import 'package:moneyexpense/models/TransactionModel.dart';
import 'package:moneyexpense/helper/dbhelper.dart';
import 'package:moneyexpense/models/Category.dart';
import 'package:format_indonesia/format_indonesia.dart';

class TransactionProvider with ChangeNotifier {
  DbHelper dbHelper = DbHelper();

  Category get selected => _selected;

  set selected(Category value) {
    _selected = value;
  }

  Category _selected;
  DateTime _date = DateTime.now();
  List<TransactionModel> _transactions;
  List<TransactionModel> _todayTransactions;
  List<int> _totalTransactionPerCategory;
  int _totalToday;

  set transactions(List<TransactionModel> value) {
    _transactions = value;
  }
  TransactionProvider() {
    _selected = categories[0];
    _totalTransactionPerCategory = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    _todayTransactions = [];
    getListTransaction();
  }
  void getListTransaction() async {
    _transactions = await dbHelper.getTransactionList();
    _todayTransactions = [];
    _totalToday = 0;

    if (_transactions.length > 0) {
      for (int i = 0; i < _transactions.length; i++) {
        if (_transactions[i].date == Waktu(DateTime.now()).yMd()) {
          _todayTransactions.add(_transactions[i]);
          _totalToday += _transactions[i].nominal;
        }
      }
    }
    _totalTransactionPerCategory = [0, 0, 0, 0, 0, 0, 0, 0, 0];

    if (_todayTransactions != null) {
      for (int k = 0; k < 9; k++) {
        for (int i = 0; i < _todayTransactions.length; i++) {
          if (_todayTransactions[i].idCategory == (k + 1))
            _totalTransactionPerCategory[k] += _todayTransactions[i].nominal;
        }
      }
    }
  }

  Future addTransaction(TransactionModel object) async {
    int res = await dbHelper.insert(object);
    print("add = "+res.toString());
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

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  List<TransactionModel> get todayTransactions => _todayTransactions;

  set todayTransactions(List<TransactionModel> value) {
    _todayTransactions = value;
  }

  List<int> get totalTransactionPerCategory => _totalTransactionPerCategory;

  set totalTransactionPerCategory(List<int> value) {
    _totalTransactionPerCategory = value;
  }

  int get totalToday => _totalToday;

  set totalToday(int value) {
    _totalToday = value;
  }
}
