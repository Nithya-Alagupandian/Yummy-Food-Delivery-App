import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/widgets/top_rate_list_item.dart';

import '../models/category_model.dart';

class TopRateListView extends StatelessWidget {
  List<Category> itemList = <Category>[];
  TopRateListView(this.itemList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      height: 165,
      child: ListView.builder(
          //shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return TopRateItemStateFul(itemList, index);
          }),
    );
  }
}
