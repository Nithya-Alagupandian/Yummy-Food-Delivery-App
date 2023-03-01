import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/utils/arrays.dart';
import 'package:yummy_food_delivery/widgets/card_listview_widget.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/banner_gif_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/card_grid_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/slider_widget.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class SwiggyScreen extends StatefulWidget {
  const SwiggyScreen({super.key});

  @override
  SwiggyScreenState createState() => SwiggyScreenState();
}

class SwiggyScreenState extends State<SwiggyScreen> {
  late DateTime _startTime;
  late String _screenName;

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    // Start timer and set screen name when screen is opened
    _startTime = DateTime.now();
    _screenName = "Swiggy Screen";
    _analytics.setCurrentScreen(screenName: _screenName);

    /*  _analytics.setCurrentScreen(screenName: 'SwiggyScreen');
    _analytics.logEvent(
        name: 'screen_view', parameters: {'screen_name': 'SwiggyScreen'}); */
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
