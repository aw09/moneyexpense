import 'package:flutter/material.dart';
import 'package:moneyexpense/custom_icon.dart';

class Category {
  final int id;
  final String name;
  final IconData iconData;

  Category({
    this.id,
    this.name,
    this.iconData,
  });
}

RawMaterialButton getCircleIcon(
    IconData icon, Color color, Color background, {double size = 20, Function press}) {
  return RawMaterialButton(
    onPressed: () {press();},
    elevation: 2.0,
    fillColor: background,
    child: Icon(
      icon,
      color: color,
      size: size,
    ),

    padding: EdgeInsets.all(size/2),
    shape: CircleBorder(),
  );
}

IconData getIconData(int id){
  return categories[id-1].iconData;
}


List<Category> categories = [
  Category(id: 1, name: 'Makanan', iconData: CustomIcon.food),
  Category(id: 2, name: 'Internet', iconData: CustomIcon.internet),
  Category(id: 3, name: 'Edukasi', iconData: CustomIcon.education),
  Category(id: 4, name: 'Hadiah', iconData: CustomIcon.gift),
  Category(id: 5, name: 'Transport', iconData: CustomIcon.car),
  Category(id: 6, name: 'Belanja', iconData: CustomIcon.shopping),
  Category(id: 7, name: 'Alat Rumah', iconData: CustomIcon.home),
  Category(id: 8, name: 'Olahraga', iconData: CustomIcon.sport),
  Category(id: 9, name: 'Hiburan', iconData: CustomIcon.entertainment),
];
