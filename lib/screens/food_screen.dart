import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/widgets/fliter_menu_widget.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '../utils/arrays.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/card_grid_widget.dart';
import '../widgets/card_listview_widget.dart';
import '../widgets/explore_list_view.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/slider_widget.dart';
import '../widgets/title_widget.dart';
import '../widgets/top_rate_list_view.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  FoodScreenState createState() => FoodScreenState();
}

class FoodScreenState extends State<FoodScreen> {
  late DateTime _startTime;
  late String _screenName;

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    // Start timer and set screen name when screen is opened
    _startTime = DateTime.now();
    _screenName = "Food Screen";
    _analytics.setCurrentScreen(screenName: _screenName);
  }

  @override
  void dispose() {
    super.dispose();

    // Stop timer and calculate screen duration when screen is closed
    final duration = DateTime.now().difference(_startTime);
    _analytics.logEvent(
      name: 'screen_view',
      parameters: <String, dynamic>{
        'screen_name': _screenName,
        'screen_duration': duration.inSeconds,
      },
    );
  }

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
