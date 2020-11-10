import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/screen/home/components/today_transaction.dart';
import 'package:moneyexpense/screen/home/components/total_by_category.dart';
import 'package:moneyexpense/custom_icon.dart';
import 'package:moneyexpense/models/Category.dart';
import 'package:provider/provider.dart';
import 'package:moneyexpense/transaction_provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TransactionProvider>(context);
    var total = provider.totalToday;
    print("Total today = " +total.toString());
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: size.width,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(color: defaultColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getCircleIcon(CustomIcon.profile, whiteColor,
                    lightGreyColor.withOpacity(0.2),
                    size: 35.0),
                SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: "Pengeluaran Anda hari ini\n",
                            style: TextStyle(color: whiteColor, fontSize: 18)),
                        TextSpan(
                          text: "Rp. ${(total!=null) ? total : 0}\n",
                          style: TextStyle(color: whiteColor, fontSize: 28),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Pengeluaran berdasarkan kategori',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              TotalByCategory(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Semua Pengeluaran',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              TodayTransaction(),
            ],
          ),
        )
      ],
    );
  }
}
