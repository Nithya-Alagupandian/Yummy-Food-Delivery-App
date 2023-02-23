import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../utils/arrays.dart';
import 'list_item_ui.dart';

class CardListView extends StatelessWidget {
  List<Category> itemList = <Category>[];
  CardListView(this.itemList, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: ListView.builder(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return ImgTxtItemView(itemList, index);
          }),
    );
  }
}
