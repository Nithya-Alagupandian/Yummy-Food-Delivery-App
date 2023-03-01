import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class DineoutScreen extends StatefulWidget {
  const DineoutScreen({super.key});

  @override
  DineoutScreenState createState() => DineoutScreenState();
}

class DineoutScreenState extends State<DineoutScreen> {
  late DateTime _startTime;
  late String _screenName;

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    // Start timer and set screen name when screen is opened
    _startTime = DateTime.now();
    _screenName = "Dineout Screen";
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
    return Container(
      color: const Color.fromARGB(255, 65, 232, 53),
      child: const Center(
        child: Text('Dineout'),
      ),
    );
  }
}
