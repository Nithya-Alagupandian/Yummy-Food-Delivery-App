import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/widgets/fliter_menu_widget.dart';

import '../utils/arrays.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/card_grid_widget.dart';
import '../widgets/card_listview_widget.dart';
import '../widgets/explore_list_view.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/slider_widget.dart';
import '../widgets/title_widget.dart';
import '../widgets/top_rate_list_view.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const PreferredSize(
                preferredSize: Size.fromHeight(50), child: AppBarUI()),
            const SearchBarWidget(),
            CardListView(foodItems),
            SliderView(sliderList),
            AppTextView("Top rated near you", 16),
            TopRateListView(categoryItems),
            AppTextView("What's on your mind?", 16),
            CardGridWidget(categoryItems),
            AppTextView("Get it quickly", 16),
            TopRateListView(categoryItems),
            FilterMenuListWidget(itemFilterList),
            AppTextView("1147 restaurants to explore", 16),
            ExploreListView(categoryItems),
          ],
        ),
      ),
    );
  }
}
