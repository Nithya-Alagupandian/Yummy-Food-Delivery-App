import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/utils/arrays.dart';
import 'package:yummy_food_delivery/widgets/card_listview_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/banner_gif_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/card_grid_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/slider_widget.dart';

class SwiggyScreen extends StatelessWidget {
  const SwiggyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PreferredSize(
                preferredSize: Size.fromHeight(50), child: AppBarUI()),
            const SearchBarWidget(),
            CardGridWidget(categoryList),
            SliderView(sliderList),
            const CheckItOutBanner(),
            CardListView(categoryItems),
            const WhatsNewBanner(),
          ],
        ),
      ),
    );
  }
}
