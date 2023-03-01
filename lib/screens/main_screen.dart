import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/screens/dineout_screen.dart';
import 'package:yummy_food_delivery/screens/genie_screen.dart';
import 'package:yummy_food_delivery/screens/instamart_screen.dart';
import 'package:yummy_food_delivery/screens/swiggy_screen.dart';
import 'package:yummy_food_delivery/screens/food_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late DateTime _startTime;
  late String _screenName;

  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    // Start timer and set screen name when screen is opened
    _startTime = DateTime.now();
    _screenName = "Main Screen";
    _analytics.setCurrentScreen(screenName: _screenName);

    print('MAIN SCREEN..........INSIDE');

    handleDynamicLinks();
  }

  Future<void> handleDynamicLinks() async {
    print('INSIDE ......handleDynamicLinks');
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    final String? screen = deepLink?.queryParameters['screen'];
    print("Screen NAME : $screen");

    if (deepLink != null) {
      final queryParams = deepLink.queryParameters;
      if (queryParams['screen'] == 'genie') {
        _selectedIndex = 4;

        print('Inside Screen name is :::   ');
        print(queryParams['screen'].toString());

        /* Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const GenieScreen())); */
      }
    } else {
      print('Deep link is empty........... : $deepLink');
    }
  }

  /*  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;
        setState(() {
          _deepLink = deepLink.toString();
        });
      },
      onError: (OnLinkErrorException e) async {
        print('Dynamic Link Failed: ${e.message}');
      },
    );
  } */

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
    Widget child = Container();

    switch (_selectedIndex) {
      case 0:
        child = SwiggyScreen();
        break;

      case 1:
        child = const FoodScreen();
        break;
      case 2:
        child = const InstamartScreen();
        break;

      case 3:
        child = const DineoutScreen();
        break;
      case 4:
        child = const GenieScreen();
        break;
    }
    return Scaffold(
      // backgroundColor: Colors.white,
      /* appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50), child: AppBarUI()), */
      body: SizedBox(child: child),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label: 'Swiggy',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Food',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Instamart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Dineout',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Genie',
        ),
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;

          print(_selectedIndex);
        });
      },
    );
  }
}
