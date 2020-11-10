import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/custom_icon.dart';
import 'package:moneyexpense/models/Category.dart';
import 'package:moneyexpense/models/TransactionModel.dart';
import 'package:moneyexpense/screen/category/category_screen.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:moneyexpense/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:format_indonesia/format_indonesia.dart';

class Body extends StatelessWidget {
  final _nameTransaction = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final controllerNominal = new MoneyMaskedTextController(
    leftSymbol: 'Rp \ ',
    thousandSeparator: ',',
    precision: 0,
    decimalSeparator: '',
  );
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    var selectedDate = provider.date;
    Category selected = provider.selected;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        IconButton(
          icon: new Icon(
            CustomIcon.back,
            size: 20,
            color: greyColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Tambah pengeluaran\nbaru',
                  style: TextStyle(fontSize: 23, height: 1.2, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Text('Nama Pengeluaran'),
                TextFormField(
                  controller: _nameTransaction,
                  decoration: const InputDecoration(
                    hintText: 'Nasi Goreng',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Mohon berikan nama transaksi';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text('Kategori'),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      getCircleIcon(
                          selected.iconData, defaultColor, whiteColor),
                      Expanded(
                        child: Text('${selected.name}'),
                      ),
                      RawMaterialButton(
                        elevation: 2.0,
                        fillColor: whiteColor,
                        child: Icon(Icons.chevron_right),
                        padding: EdgeInsets.all(1),
                        shape: CircleBorder(),
                        onPressed: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (_, __, ___) => CategoryScreen(),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Tanggal'),
                FlatButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2015, 3, 5),
                        maxTime: DateTime(2025, 6, 7), onChanged: (date) {
                      print('change $date');
                    }, onConfirm: (date) {
                      provider.changeDate(date);
                    }, currentTime: DateTime.now(), locale: LocaleType.id);
                  },
                  child: Text(
                    Waktu(selectedDate).yMMMMEEEEd(),
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Text('Nominal'),
                TextFormField(
                  controller: controllerNominal,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value.split(" ").last == '0') {
                      return 'Mohon isi nominal';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        color: defaultColor,
                        child: Text(
                          'Simpan',
                          style: TextStyle(color: whiteColor),
                        ),
                        onPressed: () {
                          TransactionModel transaction = new TransactionModel(
                            transactionName: _nameTransaction.value.text,
                            idCategory: selected.id,
                            date: Waktu(selectedDate).yMd(),
                            nominal: int.parse(controllerNominal.value.text
                                .split(" ")
                                .last
                                .split(",")
                                .join()),
                          );
                          if (_formKey.currentState.validate()) {
                            provider.addTransaction(transaction);
                            provider.changeDate(DateTime.now());
                            Navigator.pop(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
