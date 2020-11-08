import 'package:flutter/material.dart';
import 'package:moneyexpense/constants.dart';
import 'package:moneyexpense/models/Category.dart';
import 'package:moneyexpense/screen/category/components/item_category.dart';
import 'package:moneyexpense/transaction_provider.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final provider = Provider.of<TransactionProvider>(context);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            decoration: BoxDecoration(
              color: greyColor.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 1.5,
                ),
                itemBuilder: (context, index) => ItemCategory(
                    category: categories[index],
                    press: () {
                      provider.changeCategory(categories[index]);
                      Navigator.pop(context);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
