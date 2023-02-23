import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/models/category_model.dart';

import 'list_item_ui.dart';

class CardGridWidget extends StatelessWidget {
  List<Category> itemList = <Category>[];
  CardGridWidget(this.itemList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 240,
      // padding: const EdgeInsets.only(left: 10, right: 10),
      child: Center(
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                //here you can add youy action on grid element Tab
              },
              child: ImgTxtItemView(itemList, index),
            );
          },
        ),
      ),
    );
  }
}
