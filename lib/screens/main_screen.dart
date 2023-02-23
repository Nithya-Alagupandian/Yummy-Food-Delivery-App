import 'package:flutter/material.dart';
import 'package:yummy_food_delivery/screens/dineout_screen.dart';
import 'package:yummy_food_delivery/screens/genie_screen.dart';
import 'package:yummy_food_delivery/screens/instamart_screen.dart';
import 'package:yummy_food_delivery/screens/swiggy_screen.dart';
import 'package:yummy_food_delivery/screens/food_screen.dart';
import 'package:yummy_food_delivery/widgets/app_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget child = Container();

    switch (_selectedIndex) {
      case 0:
        child = const SwiggyScreen();
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
